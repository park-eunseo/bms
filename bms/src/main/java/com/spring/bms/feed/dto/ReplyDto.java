package com.spring.bms.feed.dto;

import org.springframework.stereotype.Component;

@Component
public class ReplyDto {
	String replyId;
	String memberId; 	// 본인 ID
	String nickname; 	// 본인 닉네임
	String profileName; 
	String postId;
	String topReplyId; // 상위 댓글 INDEX ID
	String mention;    // 답글단 회원 닉네임
	String content;
	String regDate;

	public String getReplyId() {
		return replyId;
	}

	public void setReplyId(String replyId) {
		this.replyId = replyId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getProfileName() {
		return profileName;
	}

	public void setProfileName(String profileName) {
		this.profileName = profileName;
	}

	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	public String getTopReplyId() {
		return topReplyId;
	}

	public void setTopReplyId(String topReplyId) {
		this.topReplyId = topReplyId;
	}

	public String getMention() {
		return mention;
	}

	public void setMention(String mention) {
		this.mention = mention;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

}
