package com.acorn.blog.board.dao;

import java.util.List;

import com.acorn.blog.board.dto.PriBoardCommentDto;

public interface PriBoardCommentDao {
	public void insert(PriBoardCommentDto dto);
	public List<PriBoardCommentDto> getList(int ref_group);
	public int getSequence();
}
