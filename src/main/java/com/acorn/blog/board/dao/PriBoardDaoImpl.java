package com.acorn.blog.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.blog.board.dto.PriBoardDto;

@Repository
public class PriBoardDaoImpl implements PriBoardDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(PriBoardDto dto) {
		session.insert("priboard.insert",dto);
	}

	@Override
	public void update(PriBoardDto dto) {
		session.update("priboard.update", dto);
	}

	@Override
	public void delete(int cont_id) {
		session.delete("priboard.delete", cont_id);
	}

	@Override
	public PriBoardDto getData(int cont_id) {
		PriBoardDto dto=session.selectOne("priboard.getData", cont_id);
		return dto;
	}

	@Override
	public List<PriBoardDto> getList(PriBoardDto dto) {
		List<PriBoardDto> list=session.selectList("priboard.getList", dto);
		return list;
	}

	@Override
	public void increaseViewCount(int cont_id) {
		session.update("priboard.increaseViewCount", cont_id);
		
	}

	@Override
	public int getCount() {
		return session.selectOne("priboard.getCount");
	}

}