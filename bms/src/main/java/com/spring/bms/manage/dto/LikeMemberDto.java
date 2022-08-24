package com.spring.bms.manage.dto;

import org.springframework.stereotype.Component;

@Component
public class LikeMemberDto {
	String likeMemberId;
	String memberId;
	String favoriteId;
	
	public String getLikeMemberId() {
		return likeMemberId;
	}
	public void setLikeMemberId(String likeMemberId) {
		this.likeMemberId = likeMemberId;
	}
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
