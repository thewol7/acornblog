package com.acorn.blog.users.dao;

import com.acorn.blog.users.dto.UsersDto;

public interface UsersDao {
	public int signin(UsersDto dto);
	public UsersDto getInfo(int user_id);
	public UsersDto getRandomPage();
	public void signup(UsersDto dto);
	public boolean idCheck(String id);
	
}
