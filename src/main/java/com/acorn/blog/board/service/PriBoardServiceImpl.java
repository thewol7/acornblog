package com.acorn.blog.board.service;

import java.util.List;

import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.blog.board.dao.PriBoardCommentDao;
import com.acorn.blog.board.dao.PriBoardDao;
import com.acorn.blog.board.dto.PriBoardCommentDto;
import com.acorn.blog.board.dto.PriBoardDto;

@Service
public class PriBoardServiceImpl implements PriBoardService{
	
	//한페이지에서 나타낼 로우의 갯수
	private static final int PAGE_ROW_COUNT=5;
	//하단 디스플레이 페이지 갯수
	private static final int PAGE_DISPLAY_COUNT=5;
	@Autowired
	private PriBoardDao priboardDao;
	@Autowired
	private PriBoardCommentDao pricommentDao;

	@Override
	public void insert(PriBoardDto dto) {
		priboardDao.insert(dto);
	}

	@Override
	public void update(PriBoardDto dto) {
		priboardDao.update(dto);
	}

	@Override
	public void delete(int cont_id) {
		priboardDao.delete(cont_id);
	}

	@Override
	public ModelAndView list(int user_id,int page_id,int pageNum) {
		//보여줄 페이지의 번호
		int Num=pageNum;
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(Num-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		//전체 row의 갯수 구하기
		int totalRow=priboardDao.getCount(page_id);
		System.out.println(totalRow);
		//전체페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호
		int startPageNum=
				1+((Num-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝페이지 보정
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount;
		}
		PriBoardDto dto=new PriBoardDto();
		dto.setUser_id(page_id);
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		//Dao 를 이용해서 글목록을 얻어온다.
		List<PriBoardDto> list=priboardDao.getList(dto);
		//ModelAndView 객체를 생성해서 
		ModelAndView mView=new ModelAndView();
		//request 영역에 담는 대신 ModelAndView 객체에 담고 
		mView.addObject("list", list);
		mView.addObject("pageNum", Num);
		mView.addObject("startPageNum", startPageNum);
		mView.addObject("endPageNum", endPageNum);
		mView.addObject("totalRow", totalRow);
		//ModelAndView 객체를 리턴해준다. 
		return mView;
	}

	@Override
	public ModelAndView detail(int cont_id) {
		ModelAndView mView=new ModelAndView();
		PriBoardDto dto=priboardDao.getData(cont_id);
		mView.addObject("dto", dto);	
		return mView;
	}

	@Override
	public void commentInsert(PriBoardCommentDto dto) {
		//1.저장할 덧글번호를 미리 읽어온다.
		int seq=pricommentDao.getSequence();
		dto.setNum(seq);//글번호로 사용한다
		//2. 원글의 덧글인지 덧글의 덧글인지 판별해서 다른 처리를 해준다.
		int comment_group=dto.getComment_group();
		if(comment_group ==0){// 0이면 원글의 댓글
			//원글의 덧글이면 그룹번호를 저장할 덧글번호로 지정한다.
			dto.setComment_group(seq);
		}
		//3. Dao를 이용해서 DB에 저장
		pricommentDao.insert(dto);
	}

	@Override
	public void increaseViewCount(int cont_id) {
		priboardDao.increaseViewCount(cont_id);
	}
	
	
}