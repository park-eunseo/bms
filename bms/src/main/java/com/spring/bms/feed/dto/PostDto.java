package com.spring.bms.feed.dto;

import org.springframework.stereotype.Component;

@Component
public class PostDto {
	String postId;
	String memberId;
	String categoryTitle;
	String title;
	String thumbnail;
	String content;
	String postPrivate;
	int likeCount;
	int ReplyCount;
	String regDate;

	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	public String getCategoryTitle() {
		return categoryTitle;
	}
	
	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}
	
	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPostPrivate() {
		return postPrivate;
	}

	public void setPostPrivate(String postPrivate) {
		this.postPrivate = postPrivate;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getReplyCount() {
		return ReplyCount;
	}

	public void setReplyCount(int replyCount) {
		ReplyCount = replyCount;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

}
