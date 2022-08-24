package com.spring.bms.feed.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.spring.bms.category.service.CategoryService;
import com.spring.bms.feed.dto.PostDto;
import com.spring.bms.feed.dto.ReplyDto;
import com.spring.bms.feed.service.FeedService;
import com.spring.bms.manage.dto.LikeMemberDto;
import com.spring.bms.manage.dto.LikePostDto;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/feed")
public class FeedController {
	@Autowired
	private FeedService feedService;
	
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("")
	public String feed(@RequestParam("id") String id, 
						@RequestParam(name = "searchWord", defaultValue = "") String searchWord, 
						@RequestParam(name = "category", required = false) String category,
						HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		Map<String, String> postMap = new HashMap<>();
		postMap.put("id", id);
		postMap.put("sessionId", (String)session.getAttribute("memberId"));
		
		if(category == null) {
			postMap.put("searchWord", searchWord);
		} else {
			postMap.put("category", category);
		}
		
		List<PostDto> postList = feedService.getPostList(postMap);

		for (PostDto postDto : postList) {
			String content = postDto.getContent().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
			content = content.replaceAll("&lt(;)?(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?&gt(;)?", "");

			// 게시글 내용 html 태그 다 제거 후
			if (content.length() > 50) 
				content = content.substring(0, 50) + "...";
				postDto.setContent(content);
		}

		session.setAttribute("memberInfo", feedService.getOneMember(id)); 		// 해당 블로그 회원의 정보 select
		session.setAttribute("memberPostList", postList); 						// 해당 회원의 게시물 전체 select
		session.setAttribute("categoryList", categoryService.getCategoryList(id));  // 해당 회원의 카테고리 전체 select
		
		return "/feedHome";
	}

	@GetMapping("/writePost")
	public String writePost() {
		return "/writePost";
	}

	@PostMapping("/writePost")
	public ResponseEntity<Object> writePost(HttpServletRequest request, MultipartHttpServletRequest multipartRequest)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");

		PostDto postDto = new PostDto();
		postDto.setMemberId(multipartRequest.getParameter("memberId"));
		postDto.setCategoryTitle(multipartRequest.getParameter("categoryTitle"));
		postDto.setTitle(multipartRequest.getParameter("title"));
		postDto.setContent(multipartRequest.getParameter("content"));
		postDto.setPostPrivate(multipartRequest.getParameter("postPrivate"));

		Iterator<String> file = multipartRequest.getFileNames();
		String filePath = "C:\\thumbnailFile\\";

		if (file.hasNext()) { // 파일을 읽어올 요소가 있는지 확인
			MultipartFile multipartFile = multipartRequest.getFile(file.next()); // 그 요소를 가져온다

			if (!multipartFile.getOriginalFilename().isEmpty()) {
				String fileName = UUID.randomUUID() + "_" + multipartFile.getOriginalFilename(); // 이미지 이름이 중복되지 않도록 고유
																								 // 식별 사용
				File f = new File(filePath + fileName);
				multipartFile.transferTo(f);
				postDto.setThumbnail(fileName);
			}
		}

		feedService.addPost(postDto);

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		String jsScript = "<script>" + "alert('게시글이 등록되었습니다.');" + "location.href = '" + request.getContextPath()
				+ "/feed?id=" + postDto.getMemberId() + "';" + "</script>";

		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}

	@GetMapping("/detailPost") // 하나의 게시글 보기
	public ModelAndView detailPost(@RequestParam("postId") String postId, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		mv.addObject("detailPost", feedService.getOnePost(postId));
		mv.addObject("replyList", feedService.getReplyList(postId));
		mv.setViewName("/detailPost");

		return mv;
	}

	@GetMapping("/modifyPost") // 게시글 수정 정보 가져오기
	public ModelAndView modifyPost(@RequestParam("postId") String postId) throws Exception {
		ModelAndView mv = new ModelAndView();

		mv.addObject("detailPost", feedService.getOnePost(postId));
		mv.setViewName("/modifyPost");

		return mv;
	}

	@PostMapping("/modifyPost")
	public ResponseEntity<Object> modifyPost(HttpServletRequest request, MultipartHttpServletRequest multipartRequest) throws Exception {
		PostDto postDto = new PostDto();
		postDto.setPostId(multipartRequest.getParameter("postId"));
		postDto.setCategoryTitle(multipartRequest.getParameter("categoryTitle"));
		postDto.setTitle(multipartRequest.getParameter("title"));
		postDto.setContent(multipartRequest.getParameter("content"));
		postDto.setPostPrivate(multipartRequest.getParameter("postPrivate"));

		Iterator<String> file = multipartRequest.getFileNames();
		String filePath = "C:\\thumbnailFile\\";

		if (file.hasNext()) { // 파일을 읽어올 요소가 있는지 확인
			MultipartFile multipartFile = multipartRequest.getFile(file.next()); // 그 요소를 가져온다

			if (!multipartFile.getOriginalFilename().isEmpty()) {
				String fileName = UUID.randomUUID() + "_" + multipartFile.getOriginalFilename(); // 이미지 이름이 중복되지 않도록 고유
																								 // 식별 사용
				File f = new File(filePath + fileName);
				multipartFile.transferTo(f);
				postDto.setThumbnail(fileName);
			}
		}
		
		feedService.modifyPost(postDto);

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		String jsScript = "<script>" + "alert('게시글이 수정되었습니다.');" + "location.href = '" + request.getContextPath()
				+ "/feed/detailPost?postId=" + postDto.getPostId() + "';" + "</script>";

		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}

	@GetMapping("/deletePost")
	public ResponseEntity<Object> deletePost(HttpServletRequest request, @RequestParam("postId") String postId)
			throws Exception {
		feedService.deletePost(postId);

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		String jsScript = "<script>" + "alert('게시글이 삭제되었습니다.');" + "location.href = '" + request.getContextPath()
				+ "/feed?id=" + request.getSession().getAttribute("memberId") + "';" + "</script>";

		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@GetMapping("/getLikePost") // 해당 게시글에 회원이 좋아요를 눌렀는지 확인
	public ResponseEntity<Object> getLikePost(LikePostDto likePostDto) throws Exception {
		return new ResponseEntity<Object>(feedService.getLikePost(likePostDto), HttpStatus.OK);
	}
	
	@GetMapping("/getLikeCount") // 해당 게시글에 좋아요가 몇 개인지
	public ResponseEntity<Object> getLikeCount(String postId) throws Exception {
		return new ResponseEntity<Object>(feedService.getLikeCount(postId), HttpStatus.OK);
	}
	
	@GetMapping("/getLikeMember") // 해당 회원을 즐겨찾기 했는지
	public ResponseEntity<Object> getLikeMember(LikeMemberDto likeMemberDto) throws Exception {
		return new ResponseEntity<Object>(feedService.getLikeMember(likeMemberDto), HttpStatus.OK);
	}
	
	@GetMapping("/getReplyCount") // 해당 게시글에 좋아요가 몇 개인지
	public ResponseEntity<Object> getReplyCount(String postId) throws Exception {
		return new ResponseEntity<Object>(feedService.getReplyCount(postId), HttpStatus.OK);
	}
	
	@PostMapping("/writeReply") // 댓글 작성
	public ResponseEntity<Object> writeReply(HttpServletRequest request, ReplyDto replyDto) throws Exception {
		feedService.writeReply(replyDto);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		String jsScript = "<script>" + "location.href='" + request.getContextPath() + 
								"/feed/detailPost?postId=" + replyDto.getPostId() + "';</script>";

		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@GetMapping("/deleteReply") // 댓글 삭제
	public ResponseEntity<Object> deleteReply(HttpServletRequest request, 
										@RequestParam("replyId") String replyId,
										@RequestParam(name = "postId", required = false) String postId ) throws Exception {
		feedService.deleteReply(replyId);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		String jsScript = "<script>" + "location.href='" + request.getContextPath() + 
								"/feed/detailPost?postId=" + postId + "';</script>";

		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}

	@PostMapping("/modifyReply")
	public ResponseEntity<Object> modifyReply(HttpServletRequest request, ReplyDto replyDto) throws Exception{
		feedService.modifyReply(replyDto);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		String jsScript = "<script>" + "location.href='" + request.getContextPath() + 
								"/feed/detailPost?postId=" + replyDto.getPostId() + "';</script>";

		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/fileUpload", produces = "application/json; charset=utf8") // 에디터에서 파일을 올렸을 때 저장하기
										// json 형태로 response
	@ResponseBody
	public String fileUpload(HttpServletRequest request, @RequestParam("file") MultipartFile multipartFile)
			throws IOException {

		JsonObject json = new JsonObject();

		String filePath = "C:\\postFile\\";
		String fileName = UUID.randomUUID() + "_" + multipartFile.getOriginalFilename();

		File file = new File(filePath + fileName);

		try {
			InputStream inputStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(inputStream, file);

			json.addProperty("url", "/imgUpload/" + fileName); // 이미지 url 전송
			json.addProperty("responseCode", "success");
		} catch (Exception e) {
			FileUtils.deleteQuietly(file); // 저장된 파일 삭제
			json.addProperty("responseCode", "error");
			e.printStackTrace();
		}

		return json.toString();
	}

	@GetMapping("/thumbnails") // 게시글 썸네일
	public void thumbnails(@RequestParam("thumbnail") String thumbnailName, HttpServletResponse response)
			throws IOException {
		OutputStream out = response.getOutputStream(); // 데이터를 출력할 메서드
		String filePath = "C:\\thumbnailFile\\" + thumbnailName;

		File file = new File(filePath);
		if (file.exists()) { // 받아온 파일이 존재한다면
			Thumbnails.of(file).size(800, 800).outputFormat("png").toOutputStream(out);
		} else {
			System.out.println("파일없음");
		}

		byte[] buffer = new byte[1024 * 8];
		out.write(buffer); // 파일을 바이트 단위로 출력
		out.close();
	}
}
