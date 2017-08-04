package com.acorn.blog.visitboard.service;


import org.springframework.web.servlet.ModelAndView;

import com.acorn.blog.visitboard.dto.VisitBoardDto;

public interface VisitBoardService {
	public void insert(VisitBoardDto dto);
	public void delete(int cont_id);
	public ModelAndView list(int page_id,int session_id);
}
