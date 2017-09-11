package com.acorn.blog;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.blog.service.HomeService;


@Controller
public class HomeController {
	
	@Autowired
	private HomeService homeService;
	
	@RequestMapping("/home.do")

	public ModelAndView home(HttpServletRequest request){
		ModelAndView mView=homeService.List((Integer)request.getSession().getAttribute("page_id"));
		return mView;

	}

}














