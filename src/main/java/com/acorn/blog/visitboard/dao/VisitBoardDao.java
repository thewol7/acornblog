package com.acorn.blog.visitboard.dao;

import java.util.List;

import com.acorn.blog.visitboard.dto.VisitBoardDto;

public interface VisitBoardDao {
	public void insert(VisitBoardDto dto);
	public void delete(int num);
	public List<VisitBoardDto> getList(VisitBoardDto dto);
	public VisitBoardDto getHostName(int page_id);
	public VisitBoardDto getWriterName(int session_id);
	public int getMaxpage(int page_id);
	public List<VisitBoardDto> homeShow(int page_id);
	
}
