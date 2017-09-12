package com.acorn.blog.others.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.blog.others.dto.othersDto;

@Repository
public class othersDaoImpl implements othersDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<othersDto> getList() {	
		return session.selectList("others.getList");
	}
	
}
