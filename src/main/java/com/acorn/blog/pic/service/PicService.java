package com.acorn.blog.pic.service;

import org.springframework.web.servlet.ModelAndView;

import com.acorn.blog.pic.dto.PicCommentDto;
import com.acorn.blog.pic.dto.PicDto;

public interface PicService {
	public void insertPics(PicDto dto);
	public ModelAndView getList(PicDto dto);
	public ModelAndView getPicdetail(PicDto dto,int page_id);
	public void increaseViewCount(int cont_id);
	public void commentInsert(PicCommentDto dto);
	public void commentDelete(int num);
	public void deletePics(int cont_id);
	public void updatePics(PicDto dto);
	public int getCount(int user_id);
}
