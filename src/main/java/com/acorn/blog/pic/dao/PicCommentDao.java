package com.acorn.blog.pic.dao;

import java.util.List;

import com.acorn.blog.pic.dto.PicCommentDto;

public interface PicCommentDao {
	public void insert(PicCommentDto dto);
	//덧글 목록을 리턴하는 메소드
	public List<PicCommentDto> getList(int ref_group);
	//새 덧글의 글번호(sequence) 값을 얻어내서 리턴해주는 메소드
	public int getSequence();
	public void delete(int num);
}
