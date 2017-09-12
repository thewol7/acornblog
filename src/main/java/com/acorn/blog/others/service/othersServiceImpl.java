package com.acorn.blog.others.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.blog.others.dao.othersDao;

@Service
public class othersServiceImpl implements othersService{

	@Autowired
	private othersDao othersdao;
	
	@Override
	public ModelAndView userList() {
		ModelAndView mView=new ModelAndView();
		mView.addObject("userList", othersdao.getList());
		return mView;
	}

}
