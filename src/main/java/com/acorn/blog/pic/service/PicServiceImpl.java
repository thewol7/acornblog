package com.acorn.blog.pic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.blog.pic.dao.PicCommentDao;
import com.acorn.blog.pic.dao.PicDao;
import com.acorn.blog.pic.dto.PicCommentDto;
import com.acorn.blog.pic.dto.PicDto;

@Service
public class PicServiceImpl implements PicService {
	
	@Autowired
	private PicDao picDao;
	
//	@Autowired
//	private PicCommentDao commentDao;
	
	@Override
	public void insertPics(PicDto dto) {
		picDao.insertPics(dto);
	}

	@Override
	public ModelAndView getList(PicDto dto) {
		List<PicDto> data=picDao.getList(dto);
		ModelAndView mView=new ModelAndView();
		mView.addObject("data",data);
		
		return mView;
	}

	@Override
	public ModelAndView getPicdetail(PicDto dto,int page_id) {
		dto.setUser_id(page_id);
		PicDto resultDto=picDao.getPicdetail(dto);
//		List<PicCommentDto> commentList=commentDao.getList(dto.getCont_id());
		ModelAndView mView=new ModelAndView();
		mView.addObject("dto",resultDto);
//		mView.addObject("commentList", commentList);
		return mView;
	}

	@Override
	public void increaseViewCount(int cont_id) {
		picDao.increaseViewCount(cont_id);
	}

	@Override
	public void deletePics(int cont_id) {
		picDao.deletePics(cont_id);
	}

	@Override
	public void updatePics(PicDto dto) {
		picDao.updatePics(dto);
	}

	@Override
	public int getCount(int user_id) {
		return picDao.getCount(user_id);
	}

//	@Override
//	public void commentInsert(PicCommentDto dto) {
//		//1. 저장할 덧글번호를 미리 읽어온다.
//		int seq=commentDao.getSequence();
//		dto.setNum(seq);
//		//2. 원글의 덧글인지 덧글의 덧글인지 판정해서 다른 처리를 해준다.
//		int comment_group=dto.getComment_group();
//		if(comment_group==0){	// 0 이면 원글의 덧글
//			//원글의 덧글이면 그룹번호를 저장할 덧글 번호로 지정한다.
//			dto.setComment_group(seq);
//		}
//		//3. Dao 를 이용해서 DB 에 저장
//		commentDao.insert(dto);
//	}

}
