package com.acorn.blog;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class HomeController {
	
	@RequestMapping("/home.do")
	public ModelAndView home(){
		
		ModelAndView mView=new ModelAndView();
	
		mView.setViewName("home");
		return mView;
	}
	@RequestMapping("/session.do")
		public ModelAndView session(){
			
			ModelAndView mView=new ModelAndView();
		
			mView.setViewName("session");
			return mView;
	}
}














