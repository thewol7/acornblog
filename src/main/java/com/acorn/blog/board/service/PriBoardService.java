package com.acorn.blog.board.service;

import org.springframework.web.servlet.ModelAndView;

import com.acorn.blog.board.dto.PriBoardCommentDto;
import com.acorn.blog.board.dto.PriBoardDto;

public interface PriBoardService {
	public void insert(PriBoardDto dto);
	public void update(PriBoardDto dto);
	public void delete(int cont_id);
	public ModelAndView list(int pageNum);
	public ModelAndView detail(int cont_id);
	public void commentInsert(PriBoardCommentDto dto);
	public void increaseViewCount(int cont_id);
}