package com.acorn.blog.board.dao;

import java.util.List;

import com.acorn.blog.board.dto.PriBoardDto;

public interface PriBoardDao {
	public void insert(PriBoardDto dto);
	public void update(PriBoardDto dto);
	public void delete(int cont_id);
	public PriBoardDto getData(int cont_id);
	public List<PriBoardDto> getList(PriBoardDto dto);
	public void increaseViewCount(int cont_id);
	public int getCount();
}
