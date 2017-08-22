package com.acorn.blog;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {
	
	@RequestMapping("/home.do")

	public String home(){
		
		return "home";

	}

//<<<<<<< HEAD
//	@RequestMapping("/session.do")
//		public ModelAndView session(){
//			
//			ModelAndView mView=new ModelAndView();
//		
//			mView.setViewName("session");
//			return mView;
//	}
//=======


}














