package com.acorn.blog.service;

import org.springframework.web.servlet.ModelAndView;

import com.acorn.blog.board.dao.PriBoardDao;
import com.acorn.blog.pic.dao.PicDao;
import com.acorn.blog.pic.dto.PicDto;
import com.acorn.blog.visitboard.dao.VisitBoardDao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomeServiceImpl implements HomeService {

	@Autowired
	private PicDao picDao;
	
	@Autowired
	private PriBoardDao priDao;
	
	@Autowired
	private VisitBoardDao visDao;
	
	
	@Override
	public ModelAndView List(int page_id) {
		ModelAndView mView=new ModelAndView();
		mView.addObject("picDto", picDao.showList(page_id));
		mView.addObject("priDto", priDao.homeList(page_id));
		mView.addObject("visDto", visDao.homeShow(page_id));	
		return mView;
	}

}
