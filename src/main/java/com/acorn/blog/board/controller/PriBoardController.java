package com.acorn.blog.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.blog.board.dao.PriBoardDao;
import com.acorn.blog.board.service.PriBoardService;

@Controller
public class PriBoardController {

	@Autowired
	private PriBoardService priboardSerivce;
	
	@RequestMapping("/board/Priboardlist")
	public ModelAndView list(@RequestParam(defaultValue="1") int pageNum){
		
		// 서비스를 이용해서 글목록이 담긴 ModelAndView 객체를 리턴받는다.
		ModelAndView mView=priboardSerivce.list(pageNum);
		//view 페이지 설정하고 
		mView.setViewName("board/Priboardlist");
		//ModelAndView 객체를 리턴해준다. 
		return mView;
	}
}
