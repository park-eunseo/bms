package com.spring.bms.post.dto;

import org.springframework.stereotype.Component;

@Component
public class PostDto {
	String authorId;
	String title;
	String content;
	String postPrivate;
	String views;
	String regDate;
	
	public String getAuthorId() {
		return authorId;
	}
	public void setAuthorId(String authorId) {
		this.authorId = authorId;
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
	public String getViews() {
		return views;
	}
	public void setViews(String views) {
		this.views = views;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
}
