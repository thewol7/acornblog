package com.acorn.blog.visitboard.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.blog.visitboard.dto.VisitBoardDto;
import com.acorn.blog.visitboard.service.VisitBoardService;

@Controller
public class VisitBoardController {

	@Autowired
	private VisitBoardService visitboardService;
	
	@RequestMapping("/visitboard/list")
	public ModelAndView controllist(HttpSession session){
		int session_id=(Integer)session.getAttribute("id");
		int page_id=(Integer)session.getAttribute("page_id");	
		//서비스를 이용해서 글목록이 담긴 ModelAndView 객체를 리턴받는다.
		
		ModelAndView mView=visitboardService.list(page_id,session_id);
		//view 페이지 설정하고
		mView.setViewName("visitboard/list");
		//ModelAdnView 객체를 리턴해준다.		
		return mView;
		
	}
	@RequestMapping("/visitboard/insert")
	public String insert(HttpServletRequest request){
		VisitBoardDto dto =new VisitBoardDto();
		dto.setContent(request.getParameter("content"));
		dto.setUser_id((Integer)request.getSession().getAttribute("page_id"));
		dto.setWriter_id((Integer)request.getSession().getAttribute("id"));
		visitboardService.insert(dto);
		return "redirect:list.do";
	}
	@RequestMapping("/visitboard/delete")
	public String delete(@RequestParam int cont_id){
		visitboardService.delete(cont_id);
		return "redirect:list.do";
	}
}
