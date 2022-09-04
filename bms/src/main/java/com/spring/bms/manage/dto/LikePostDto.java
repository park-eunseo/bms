package com.spring.bms.manage.dto;

import org.springframework.stereotype.Component;

@Component
public class LikePostDto {
	private String memberId;
	private String postId;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	public String getPostId() {
		return postId;
	}
	public void setPostId(String postId) {
		this.postId = postId;
	}

}
