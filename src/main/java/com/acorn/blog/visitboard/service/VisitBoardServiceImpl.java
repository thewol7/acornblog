package com.acorn.blog.visitboard.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.blog.visitboard.dao.VisitBoardDao;
import com.acorn.blog.visitboard.dto.VisitBoardDto;
@Service
public class VisitBoardServiceImpl implements VisitBoardService{

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
	public ModelAndView list(int page_id,int session_id) {		
		List<VisitBoardDto> list = visitboardDao.getList();
		VisitBoardDto writernamedto=visitboardDao.getWriterName(session_id);
		VisitBoardDto hostnamedto=visitboardDao.getHostName(page_id);
		ModelAndView mView= new ModelAndView();
		mView.addObject("list",list);
		mView.addObject("writernamedto",writernamedto);
		mView.addObject("hostnamedto",hostnamedto);
		return mView;
	}

}
