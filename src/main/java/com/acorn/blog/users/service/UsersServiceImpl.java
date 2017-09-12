package com.acorn.blog.users.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.blog.users.dao.UsersDao;
import com.acorn.blog.users.dto.UsersDto;

@Service
public class UsersServiceImpl implements UsersService {

	@Autowired
	private UsersDao usersDao;

	@Override
	public ModelAndView signin(UsersDto dto, HttpServletRequest request) {
		int result = usersDao.signin(dto);
		ModelAndView mView = new ModelAndView();
		String url = request.getParameter("url");

		if (result == 0) {
			mView.addObject("msg", "아이디 혹은 비밀번호가 틀려요.");
			String location = request.getContextPath() + "/users/signin_form.do?url=" + url;
			mView.addObject("url", location);
		} else {
			request.getSession().setAttribute("id", result);
			// 로그인 후에는 page id를 로그인된 id로 변경해줘서 메인에 있는 profile을 session id로
			request.getSession().setAttribute("page_id", request.getSession().getAttribute("id"));
			mView.addObject("msg", dto.getId() + " 님 로그인 되었습니다.");
			mView.addObject("url", url);
		}

		return mView;
	}

	@Override
	public ModelAndView signup(UsersDto dto, HttpServletRequest request) {
		System.out.println("email:" + dto.getEmail());
		String url="";
		if(request.getParameter("url")!=null){
			url=request.getParameter("url");
		}
		
		/* 프로필 이미지 */
		String photo_value="";
		if(request.getParameter("photo_value")!=null){
			photo_value=request.getParameter("photo_value");
		}
		System.out.println("value:" + photo_value);
		String profile_image = null;
		if (photo_value.equals("")) {
			/* 프로필 이미지 변경하지 않았을 경우 프로젝트 내에 있는 default 이미지로 */
			profile_image = "https://ucarecdn.com/43f25772-8c37-44a6-9368-4c1b6867d8fb/default.png";
			dto.setProfile_img(profile_image);
			System.out.println("profile_dafault: " + profile_image);
		} else {
			profile_image = photo_value;
			dto.setProfile_img(profile_image);
			System.out.println("profile_image: " + profile_image);
		}

		/*if (usersDao.idCheck(request.getParameter("id"))) { // 사용중인 아이디일 경우..
			System.out.println("정보실패");
			ModelAndView mView = new ModelAndView();
			mView.addObject("msg", "중복된 ID 입니다. 다시 확인해주세요");
			String location = request.getContextPath() + "/users/signup_form.do?url=" + url;
			mView.addObject("url", location);
			return mView;
			// 새로운 회원정보를 저장하고
		}*/ 
		System.out.println("정보저장 시작");
		usersDao.signup(dto);
		// ModelAndView 객체를 생성해서 정보를 담은 다음
		ModelAndView mView = new ModelAndView();
		mView.addObject("msg", dto.getName() + " 회원님 가입 되었습니다.");
		mView.addObject("url", request.getContextPath()+"/home.do");
		// ModelAndView 객체를 리턴해준다.
		return mView;
		
	}

	//사용 가능한 아이디인지 여부 확인
	@Override
	public boolean idCheck(String id) {
		//사용가능한 아이디 인지 여부를 리턴받아서 
		boolean canUse=usersDao.idCheck(id);
		//리턴해준다. 
		return canUse;
	}
	
	//회원정보 수정 처리 
	@Override
	public void update(UsersDto dto, HttpServletRequest request) {
		/* 프로필 이미지 */
		String photo_value = request.getParameter("photo_value");
		System.out.println("value:" + photo_value);
		String profile_image = null;
		if (photo_value.equals("")) {
			/* 프로필 이미지 변경하지 않았을 경우 프로젝트 내에 있는 default 이미지로 */
			profile_image = "https://ucarecdn.com/43f25772-8c37-44a6-9368-4c1b6867d8fb/default.png";
			dto.setProfile_img(profile_image);
			System.out.println("profile_dafault: " + profile_image);
		} else {
			profile_image = photo_value;
			dto.setProfile_img(profile_image);
			System.out.println("profile_image: " + profile_image);
		}
		usersDao.update(dto);
	}
	/*
	 * @Override public ModelAndView signup(UsersDto dto, HttpServletRequest
	 * request) { // TODO Auto-generated method stub return null; }
	 */

}
