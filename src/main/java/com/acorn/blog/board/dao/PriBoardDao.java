package com.acorn.blog.board.dao;

import java.util.List;

import com.acorn.blog.board.dto.PriBoardDto;

public interface PriBoardDao {
	public void insert(PriBoardDto dto);
	public void update(PriBoardDto dto);
	public void delete(int num);
	public PriBoardDto getData(int num);
	public List<PriBoardDto> getList(PriBoardDto dto);
	public void increaseViewCount(int num);
	public int getCount(int page_id);

}
