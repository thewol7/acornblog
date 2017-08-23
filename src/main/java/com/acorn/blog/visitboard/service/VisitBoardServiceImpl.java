package com.acorn.blog.visitboard.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.blog.visitboard.dao.VisitBoardDao;
import com.acorn.blog.visitboard.dto.VisitBoardDto;
@Service
public class VisitBoardServiceImpl implements VisitBoardService{
	private static final int PAGE_ROW_COUNT=5;
	private static final int PAGE_DISPLAY_COUNT=5;
	
	@Autowired
	private VisitBoardDao visitboardDao;
	
	@Override
	public void insert(VisitBoardDto dto) {
		visitboardDao.insert(dto);
		
	}

	@Override
	public void delete(int cont_id) {
		visitboardDao.delete(cont_id);
		
	}

	@Override
	public ModelAndView list(int page_id,int session_id,HttpServletRequest request) {	
		int pageNum=1;
		String strPageNum=request.getParameter("pageNum");
		if(strPageNum != null){
			pageNum=Integer.parseInt(strPageNum);
		}
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		int totalRow =visitboardDao.getMaxpage((Integer)request.getSession().getAttribute("page_id"));
		int totalPageCount=(int)Math.ceil((double)totalRow/(double)PAGE_ROW_COUNT);
		int startPageNum=
				1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount;
		}
		
		
		VisitBoardDto dto = new VisitBoardDto();
		dto.setUser_id(page_id);
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		List<VisitBoardDto> list = visitboardDao.getList(dto);
		VisitBoardDto writernamedto=visitboardDao.getWriterName(session_id);
		VisitBoardDto hostnamedto=visitboardDao.getHostName(page_id);
		ModelAndView mView= new ModelAndView();
		mView.addObject("list",list);
		mView.addObject("pageNum", pageNum);
		mView.addObject("startPageNum", startPageNum);
		mView.addObject("endPageNum",endPageNum);
		mView.addObject("totalPageCount", totalPageCount);
		mView.addObject("writernamedto",writernamedto);
		mView.addObject("hostnamedto",hostnamedto);
		return mView;
	}

}
