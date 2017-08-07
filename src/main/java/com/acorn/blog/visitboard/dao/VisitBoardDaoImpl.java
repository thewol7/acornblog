package com.acorn.blog.visitboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.blog.visitboard.dto.VisitBoardDto;
@Repository
public class VisitBoardDaoImpl implements VisitBoardDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(VisitBoardDto dto) {
		session.insert("visitboard.insert",dto);
		
	}

	@Override
	public void delete(int cont_id) {
		session.delete("visitboard.delete",cont_id);
		
	}

	@Override
	public List<VisitBoardDto> getList(int page_id) {		
		return session.selectList("visitboard.getList",page_id);
	}

	@Override
	public VisitBoardDto getHostName(int page_id) {
		
		return session.selectOne("visitboard.getHostName",page_id);
	}

	@Override
	public VisitBoardDto getWriterName(int session_id) {
		
		return session.selectOne("visitboard.getWriterName",session_id);
	}

	@Override
	public int getMaxpage(int page_id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
