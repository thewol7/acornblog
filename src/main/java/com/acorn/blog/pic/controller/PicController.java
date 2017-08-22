package com.acorn.blog.pic.controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.blog.pic.dto.PicCommentDto;
import com.acorn.blog.pic.dto.PicDto;
import com.acorn.blog.pic.service.PicService;

@Controller
public class PicController {
	//한 페이지에 나타낼 로우의 갯수
	private static final int PAGE_ROW_COUNT=5;
	//하단 디스플레이 페이지 갯수
	private static final int PAGE_DISPLAY_COUNT=5;
	
	@Autowired
	private PicService picService;
	
	//덧글 입력 요청처리
	@RequestMapping("/picboard/comment_insert")
	public String commentInsert(@ModelAttribute PicCommentDto dto){
		// @ModelAttribute 어노테이션을 이용해서 덧글정보를 얻어온다.
		
		//서비스 객체를 이용해서 덧글이 저장될 수 있도록 한다.
		picService.commentInsert(dto);
		
		//원글의 글번호를 읽어와서
		int num=dto.getRef_group();
		
		//리다이렉트 응답할 때 사용한다.
		return "redirect:/picboard/detail.do?num="+num;
	}
	
	@RequestMapping("/picboard/picboardlist")
	public ModelAndView getList(HttpServletRequest request){
		
		//BoardDto 객체를 생성해서
		PicDto dto=new PicDto();
		
		//보여줄 페이지의 번호
		int pageNum=1;
		//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어온다.
		String strPageNum=request.getParameter("pageNum");
		if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
			//페이지 번호를 설정한다.
			pageNum=Integer.parseInt(strPageNum);
		}
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		//전체 row 의 갯수를 DB 에서 얻어온다.
		int totalRow = picService.getCount();
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}
				
		//시작 row 번호와 끝 row 번호를 dto 에 담는다. 
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		ModelAndView mView=picService.getList(dto);
		mView.addObject("pageNum",pageNum);
		mView.addObject("startPageNum",startPageNum);
		mView.addObject("endPageNum",endPageNum);
		mView.addObject("totalPageCount",totalPageCount);
		
		mView.setViewName("picboard/picboardlist");
		
		return mView;
	}
	
	@RequestMapping("/picboard/picboardwriteform")
	public ModelAndView privateInsertform(HttpServletRequest request){
		ModelAndView mView=new ModelAndView();
		mView.setViewName("picboard/picboardwriteform");
		return mView;
	}
	
	@RequestMapping("/picboard/picboardwrite")
	public String privateInsert(HttpServletRequest request,@ModelAttribute PicDto dto){
		// 글쓰기 저장 동작
		String content = (String) request.getParameter("ckValue");
		/*------추출한 content에서 http 속성을 추출해서 저장하는 부분-------*/
		// 정규식은 http://로 시작해서 * 모든문자 (숫자/)로 끝나는 문자 패턴 http://.*([0-9a-zA-Z]/)
		Pattern patternImg = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
		Pattern patternHttp = Pattern.compile("http://.*([0-9a-zA-Z]/)");
		String getContent_Org = content;

		Matcher matchOrg = patternImg.matcher(getContent_Org);
		System.out.println("matchOrg: " + matchOrg);
		String pic_OrgUrl = null;
		if (matchOrg.find()) { // 이미지 태그를 찾았다면,,
			pic_OrgUrl = matchOrg.group(0); // 글 내용 중에 첫번째 이미지 태그를 뽑아옴.
		}
		System.out.println("pic OrgUrl 추출 완료");
		System.out.println(pic_OrgUrl);

		/* 여기까지 img태그 뽑아내고 아래는 http로 저장될 구문을 뽑아낸다 */
		String getContent_Save = pic_OrgUrl;
		Matcher matchSave = patternHttp.matcher(getContent_Save);
		String pic_SaveUrl = null;
		if (matchSave.find()) {
			pic_SaveUrl = matchSave.group(0);
		}
		/*---------------------------------------------------------------*/
		dto.setContent_content(content);
		dto.setUser_id((Integer)request.getSession().getAttribute("id"));
		dto.setPic(pic_SaveUrl);
		picService.insertPics(dto);
		
		return "redirect:/picboard/picboardlist.do";
	}
	
	@RequestMapping("/picboard/picboarddetail")
	public ModelAndView getData(PicDto dto, HttpServletRequest request){
		int cont_id=Integer.parseInt(request.getParameter("cont_id"));

		dto.setCont_id(cont_id);
		
		ModelAndView mView=picService.getPicdetail(dto);
		
		mView.setViewName("picboard/picboarddetail");
		String id=(String)request.getSession().getAttribute("writer");

		if(id==null){
			mView.addObject("isLogin", false);
		}else{
			mView.addObject("isLogin", true);
		}

		picService.increaseViewCount(dto.getCont_id());
		mView.addObject("cont_id",cont_id);
		//리턴해준다.
		return mView;
	}
	
	@RequestMapping("/picboard/picboardupdateform")
	public ModelAndView privateUpdateform(HttpServletRequest request,@ModelAttribute PicDto dto){
		int cont_id=Integer.parseInt(request.getParameter("cont_id"));
		ModelAndView mView=picService.getPicdetail(dto);
		mView.setViewName("picboard/picboardupdateform");
		mView.addObject("cont_id",cont_id);
		return mView;
	}
	
	@RequestMapping("/picboard/picboardupdate")
	public ModelAndView idCheckUpdate(HttpServletRequest request,@ModelAttribute PicDto dto){
		int cont_id=Integer.parseInt(request.getParameter("cont_id"));
		String content_content=request.getParameter("ckContent");
		
		dto.setContent_content(content_content);
		dto.setCont_id(cont_id);
		picService.updatePics(dto);
		
		ModelAndView mView=new ModelAndView();
		mView.addObject("cont_id", cont_id);
		mView.setViewName("picboard/picboarddetail");
		return mView;
	}
	
	@RequestMapping("/picboard/picboarddelete")
	public String idCheckDelete(HttpSession session,@RequestParam int cont_id){
		picService.deletePics(cont_id);
		return "redirect:/picboard/picboardlist.do";
	}
}
