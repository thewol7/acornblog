package com.acorn.blog;



import org.springframework.stereotype.Controller;
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
}














