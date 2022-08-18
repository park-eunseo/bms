package com.spring.bms.post.dao;

import com.spring.bms.post.dto.PostDto;

public interface PostDao {

	public void insertPost(PostDto postDto) throws Exception;

}
