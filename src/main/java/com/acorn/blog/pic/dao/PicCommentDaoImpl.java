package com.acorn.blog.pic.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.blog.pic.dto.PicCommentDto;

@Repository
public class PicCommentDaoImpl implements PicCommentDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(PicCommentDto dto) {
		session.insert("picComment.insert", dto);
	}

	@Override
	public List<PicCommentDto> getList(int ref_group) {
		return session.selectList("picComment.getList", ref_group);
	}

	@Override
	public int getSequence() {
		return session.selectOne("picComment.getSequence");
	}

	@Override
	public void delete(int num) {
		session.delete("picComment.delete", num);
	}

}
