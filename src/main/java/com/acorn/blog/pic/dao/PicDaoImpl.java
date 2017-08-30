package com.acorn.blog.pic.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.blog.pic.dto.PicDto;

@Repository
public class PicDaoImpl implements PicDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public void insertPics(PicDto dto) {
		session.insert("pic.insert", dto);
	}

	@Override
	public List<PicDto> getList(PicDto dto) {
		return session.selectList("pic.getList", dto);
	}

	@Override
	public PicDto getPicdetail(PicDto dto) {
		return session.selectOne("pic.getPicDetail", dto);
	}

	@Override
	public void increaseViewCount(int cont_id) {
		session.update("pic.increaseViewCount",cont_id);
	}

	@Override
	public void deletePics(int cont_id) {
		session.delete("pic.delete",cont_id);
	}

	@Override
	public void updatePics(PicDto dto) {
		session.update("pic.update", dto);
	}

	@Override
	public int getCount(int user_id) {
		return session.selectOne("pic.getCount",user_id);
	}

}
