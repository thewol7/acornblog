package com.acorn.blog.others.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.blog.others.service.othersService;

@Controller
public class othersController {
	@Autowired
	private othersService othersservice;
	
	@RequestMapping("others/userlist")
	public ModelAndView userlist(){
		ModelAndView mView = othersservice.userList();
		mView.setViewName("others/userlist");
		return mView;
	}
}
