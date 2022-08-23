package com.spring.bms.like.dto;

import org.springframework.stereotype.Component;

@Component
public class LikeMemberDto {
	String memberId;
	String favoriteId;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getFavoriteId() {
		return favoriteId;
	}
	public void setFavoriteId(String favoriteId) {
		this.favoriteId = favoriteId;
	}
}
