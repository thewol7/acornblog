package com.acorn.blog.users.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.acorn.blog.users.dto.UsersDto;

public interface UsersService {
	public ModelAndView signin(UsersDto dto, HttpServletRequest request);
	public ModelAndView signup(UsersDto dto, HttpServletRequest request);
}
