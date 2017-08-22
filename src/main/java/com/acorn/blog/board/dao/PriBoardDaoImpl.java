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
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(PriBoardDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public PriBoardDto getData(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PriBoardDto> getList(PriBoardDto dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void increaseViewCount(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}
