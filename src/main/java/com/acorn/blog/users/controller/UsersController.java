package com.acorn.blog.users.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.blog.users.dto.UsersDto;
import com.acorn.blog.users.service.UsersService;

@Controller
public class UsersController {
		
	@Autowired
	private UsersService usersService;
	
	@RequestMapping("/users/signin_form")
	public String signinForm(){
		
		return "users/signin_form";
	}
		
	@RequestMapping("/users/signup_form")
	public String sinupForm(){
		
		return "users/signup_form";
	}
	
	@RequestMapping("/users/signin")
	public ModelAndView signin(@ModelAttribute UsersDto dto, 
				HttpServletRequest request){
		
		ModelAndView mView=usersService.signin(dto, request);
		
		mView.setViewName("users/alert");
		return mView;
	}
	
	@RequestMapping("/users/signout")
	public ModelAndView signout(HttpSession session){
		session.invalidate();
		ModelAndView mView=new ModelAndView();
		mView.addObject("msg", "로그 아웃 되었습니다.");
		mView.addObject("url", 
				session.getServletContext().getContextPath());
		mView.setViewName("users/alert");
		
		return mView;
	}
	
	@RequestMapping("/users/signup")
	public ModelAndView signup(@ModelAttribute UsersDto dto, 
				HttpServletRequest request){
		ModelAndView mView=usersService.signup(dto, request);
		mView.setViewName("users/alert");
		return mView;
	}

}


















