package com.acorn.blog.pic.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.blog.pic.dto.PicCommentDto;
import com.acorn.blog.pic.dto.PicDto;
import com.acorn.blog.pic.service.PicService;

@Controller
public class PicController {
	//한 페이지에 나타낼 로우의 갯수
	private static final int PAGE_ROW_COUNT=5;
	//하단 디스플레이 페이지 갯수
	private static final int PAGE_DISPLAY_COUNT=5;
	
	@Autowired
	private PicService picService;
	
	//덧글 입력 요청처리
	@RequestMapping("/picboard/comment_insert")
	public String commentInsert(@ModelAttribute PicCommentDto dto){
		// @ModelAttribute 어노테이션을 이용해서 덧글정보를 얻어온다.
		
		//서비스 객체를 이용해서 덧글이 저장될 수 있도록 한다.
		picService.commentInsert(dto);
		
		//원글의 글번호를 읽어와서
		int num=dto.getRef_group();
		
		//리다이렉트 응답할 때 사용한다.
		return "redirect:/picboard/detail.do?num="+num;
	}
	
	@RequestMapping("/picboard/picboardlist")
	public ModelAndView getList(HttpServletRequest request){
		
		//BoardDto 객체를 생성해서
		PicDto dto=new PicDto();
		
		//보여줄 페이지의 번호
		int pageNum=1;
		//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어온다.
		String strPageNum=request.getParameter("pageNum");
		if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
			//페이지 번호를 설정한다.
			pageNum=Integer.parseInt(strPageNum);
		}
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		//전체 row 의 갯수를 DB 에서 얻어온다.
		int totalRow = picService.getCount();
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}
				
		//시작 row 번호와 끝 row 번호를 dto 에 담는다. 
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		ModelAndView mView=picService.getList(dto);
		mView.addObject("pageNum",pageNum);
		mView.addObject("startPageNum",startPageNum);
		mView.addObject("endPageNum",endPageNum);
		mView.addObject("totalPageCount",totalPageCount);
		
		mView.setViewName("picboard/picboardlist");
		
		return mView;
	}
	
	@RequestMapping("/picboard/picboardwriteform")
	public ModelAndView privateInsertform(HttpServletRequest request){
		ModelAndView mView=new ModelAndView();
		mView.setViewName("picboard/picboardwriteform");
		return mView;
	}
	
	@RequestMapping("/picboard/picboardwrite")
	public String idCheckInsert(HttpSession session, @ModelAttribute PicDto dto){
		int user_id=(Integer)session.getAttribute("id");
		dto.setUser_id(user_id);
		picService.insertPics(dto);
		
		return "redirect:/picboard/picboardlist.do";
	}
	
	@RequestMapping("/picboard/picboarddetail")
	public ModelAndView getData(PicDto dto, HttpServletRequest request){
		//1. 파라미터로 전달되는 글번호를 읽어온다.
		int cont_id=Integer.parseInt(request.getParameter("num"));

		//글번호도 dto 에 담는다.
		dto.setCont_id(cont_id);
		
		//2. Dao 를 이용해서 글정보를 얻어온다.
		ModelAndView mView=picService.getPicdetail(dto);
		
		mView.setViewName("picboard/picboarddetail");
		String id=(String)request.getSession().getAttribute("id");
		//로그인 했는지 여부도 ModelAndView 객체에 담아서
		if(id==null){
			mView.addObject("isLogin", false);
		}else{
			mView.addObject("isLogin", true);
		}

		picService.increaseViewCount(dto.getCont_id());
		//리턴해준다.
		return mView;
	}
	
	@RequestMapping("/picboard/picboardupdateform")
	public ModelAndView privateUpdateform(HttpServletRequest request,@ModelAttribute PicDto dto){
		ModelAndView mView=picService.getPicdetail(dto);
		mView.setViewName("picboard/picboardupdateform");
		return mView;
	}
	
	@RequestMapping("/picboard/update")
	public String idCheckUpdate(HttpSession session,@ModelAttribute PicDto dto){
		//글 작성자는 세션에서 얻어내서
		int user_id=(Integer)session.getAttribute("id");
		//Dto 에 담고
		dto.setUser_id(user_id);
		//서비스 객체를 이용해서 수정 반영한다.
		picService.updatePics(dto);
		return "redirect:/picboard/picboardlist.do";
	}
	
	@RequestMapping("/picboard/delete")
	public String idCheckDelete(HttpSession session,@RequestParam int num){
		picService.deletePics(num);
		return "redirect:/picboard/picboardlist.do";
	}
}
