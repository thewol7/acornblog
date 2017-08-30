package com.acorn.blog.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.blog.board.dto.PriBoardCommentDto;

@Repository
public class PriBoardCommentDaoImpl implements PriBoardCommentDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(PriBoardCommentDto dto) {
		session.insert("pricomment.insert", dto);
	}

	@Override
	public List<PriBoardCommentDto> getList(int ref_group) {
		List<PriBoardCommentDto> list=session.selectList("pricomment.getList", ref_group);
		return list;
	}

	@Override
	public int getSequence() {
		int seq=session.selectOne("pricomment.getSequence");
		return seq;
	}
	@Override
	public void delete(int num) {
		session.delete("pricomment.delete", num);
	}

}