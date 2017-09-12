package com.acorn.blog.users.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	// ajax 요청 처리 
	@RequestMapping("/users/idCheck")
	@ResponseBody // json 문자열 응답하기 위해 
	public Map<String, Object> checkid(@RequestParam String inputId){
		//서비스를 이용해서 아이디 사용가능 여부를 얻어내서 
		boolean canUse=usersService.idCheck(inputId);
		// jackson 라이브러리를 통해서 json 문자열이 출력되도록 
		// Map 에 담아서 
		Map<String, Object> map=new HashMap<>();
		map.put("canUse", canUse);
		// 리턴해준다. 
		return map;
	}
	
	@RequestMapping("/users/info")
	public ModelAndView privateInfo(HttpServletRequest request){
		ModelAndView mView = new ModelAndView();
		mView.setViewName("users/info");
		return mView;
	}
	

	@RequestMapping("/users/updateform")
	public ModelAndView privateUpdateform(HttpServletRequest request){
		ModelAndView mView = new ModelAndView();
		mView.setViewName("users/updateform");
		return mView;
	}
	
	@RequestMapping("/users/update")
	public ModelAndView privateUpdate(HttpServletRequest request,
			@ModelAttribute UsersDto dto){
		usersService.update(dto, request);
		ModelAndView mView=new ModelAndView();
		mView.addObject("msg", "수정하였습니다.");
		String url=request.getContextPath()+"/users/info.do";
		mView.addObject("url", url);
		mView.setViewName("users/alert");
		return mView;
	}

}


















