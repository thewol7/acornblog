package com.acorn.blog.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.blog.board.dao.PriBoardDao;
import com.acorn.blog.board.dto.PriBoardCommentDto;
import com.acorn.blog.board.dto.PriBoardDto;
import com.acorn.blog.board.service.PriBoardService;

@Controller
public class PriBoardController {

	@Autowired
	private PriBoardService priboardSerivce;
	
	@RequestMapping("/board/priboardlist")
	public ModelAndView list(HttpServletRequest request,HttpSession session,@RequestParam(defaultValue="1") int pageNum){
		int user_id=(int)session.getAttribute("id");
		int page_id=(int)session.getAttribute("page_id");
		// 서비스를 이용해서 글목록이 담긴 ModelAndView 객체를 리턴받는다.
		
		ModelAndView mView=priboardSerivce.list(user_id,page_id,pageNum);
		//view 페이지 설정하고 
		mView.setViewName("board/priboardlist");
		//ModelAndView 객체를 리턴해준다. 
		return mView;
	}
	
	@RequestMapping("/board/priboarddetail")
	public ModelAndView detail(@RequestParam int cont_id){
		ModelAndView mView=priboardSerivce.detail(cont_id);
		priboardSerivce.increaseViewCount(cont_id);
		mView.setViewName("board/priboarddetail");
		return mView;
		
	}
	
	@RequestMapping("/board/priboardinsertform")
	public ModelAndView insertform(HttpServletRequest request){
		ModelAndView mView=new ModelAndView();
		mView.setViewName("board/priboardinsertform");
		return mView;
	}
	
	@RequestMapping("/board/priboardinsert")
	public String insert(HttpSession session,
			@ModelAttribute PriBoardDto dto){
		dto.setUser_id((int)session.getAttribute("id"));
		priboardSerivce.insert(dto);
		
		return "redirect:/board/priboardlist.do";
	};
	
	@RequestMapping("/board/priboardupdateform")
	public ModelAndView updateform(@RequestParam int cont_id){
		ModelAndView mView=priboardSerivce.detail(cont_id);
		mView.setViewName("board/priboardupdateform");
		return mView;
	}
	
	@RequestMapping("/board/priboardupdate")
	public String update(@ModelAttribute PriBoardDto dto){
		int cont_id=dto.getCont_id();
		priboardSerivce.update(dto);
		return "redirect:/board/priboarddetail.do?cont_id="+cont_id;
	}
	
	@RequestMapping("/board/priboarddelete")
	public String delete(@RequestParam int cont_id){
		priboardSerivce.delete(cont_id);
		return "redirect:/board/priboardlist.do";
	}
	
	@RequestMapping("/board/pricommentinsert")
	public String commentInsert(HttpSession session,@RequestParam int cont_id,
			@ModelAttribute PriBoardCommentDto dto){
		dto.setRef_group(cont_id);
		priboardSerivce.commentInsert(dto);
		return "redirect:/board/priboarddetail.do?cont_id="+cont_id;
	}
	
	@RequestMapping("/board/pricommentdelete")
	public String commentDelete(@RequestParam int num,@RequestParam int cont_id){
		priboardSerivce.commentDelete(num);
		return "redirect:/board/priboarddetail.do?cont_id="+cont_id;
	}
}