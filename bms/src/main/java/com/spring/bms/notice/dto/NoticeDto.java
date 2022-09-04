package com.spring.bms.notice.dto;

import org.springframework.stereotype.Component;

@Component
public class NoticeDto {
	private String noticeId;
	private String toId;  	 // 알림 수신자
	private String fromId; 	 // 알림 송신자
	private String postId; 	 // 게시글 ID
	private String replyId;  // 답댓글 상위 ID
	private String content;  // 해당 글 또는 댓글 내용
	private String category; // 알림 종류
	private String regDate;  // 알림 시간
	
	public String getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}
	public String getToId() {
		return toId;
	}
	public void setToId(String toId) {
		this.toId = toId;
	}
	public String getFromId() {
		return fromId;
	}
	public void setFromId(String fromId) {
		this.fromId = fromId;
	}
	public String getPostId() {
		return postId;
	}
	public void setPostId(String postId) {
		this.postId = postId;
	}
	
	public String getReplyId() {
		return replyId;
	}
	public void setReplyId(String replyId) {
		this.replyId = replyId;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
}
