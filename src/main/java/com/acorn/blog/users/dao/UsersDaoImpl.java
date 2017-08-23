package com.acorn.blog.users.dao;

import java.util.List;
import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.blog.users.dto.UsersDto;

@Repository
public class UsersDaoImpl implements UsersDao {
	
	@Autowired
	private SqlSession session;
		
	@Override
	public int signin(UsersDto dto){
		Object result=session.selectOne("users.signin", dto);
		if(result!=null){
			return (int)result;
		}else{
			return 0;
		}
	}
	
	@Override
	public UsersDto getInfo(int user_id){
		UsersDto dto=session.selectOne("users.getInfo", user_id);
		return dto;
	}

	@Override
	public UsersDto getRandomPage() {
		List<UsersDto> users=session.selectList("users.getRandomPage");
		/*session.close();*/
		if(users.size()>0){
			Random ran=new Random();
			int result=ran.nextInt(users.size());
			return users.get(result);
		}else{
			return new UsersDto();
		}
	}

	@Override
	public void signup(UsersDto dto) {
		session.insert("users.signup", dto);
	}

	@Override
	public boolean idCheck(String id) {
		int result=session.selectOne("users.idcheck", id);
		if(result>0){
			return false;
		}else{
			return true;
		}
	}
	
	@Override
	public void update(UsersDto dto) {
		session.update("users.update", dto);
	}

}
