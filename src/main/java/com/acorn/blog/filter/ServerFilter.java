package com.acorn.blog.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.blog.users.dao.UsersDao;
import com.acorn.blog.users.dto.UsersDto;

@Service("ServerFilter")
public class ServerFilter implements Filter {
	
	@Autowired
	private UsersDao usersDao;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest request=(HttpServletRequest) req;
		HttpServletResponse response=(HttpServletResponse) res;
		String[] tmp=request.getRequestURI().split("/");
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		if(request.getParameter("page_id")!=null){
			request.getSession().setAttribute("page_id", Integer.parseInt(request.getParameter("page_id")));
		}else if(request.getSession().getAttribute("page_id")==null){
			request.getSession().setAttribute("page_id", usersDao.getRandomPage().getUser_id());
		}
		if(request.getSession().getAttribute("page_id")==null){
			if(request.getSession().getAttribute("id")!=null){
				request.getSession().setAttribute("page_id", (Integer) request.getSession().getAttribute("id"));
				UsersDto dto=usersDao.getInfo((Integer) request.getSession().getAttribute("page_id"));
				request.setAttribute("userdata", dto);
			}else{
				request.getSession().setAttribute("page_id", usersDao.getRandomPage().getUser_id());
			}
		}else{
			UsersDto dto=usersDao.getInfo((Integer) request.getSession().getAttribute("page_id"));
			request.setAttribute("userdata", dto);
		}
		
		if(request.getSession().getAttribute("id")!=null){
			if(request.getSession().getAttribute("mydata")==null){
				UsersDto dto=usersDao.getInfo((Integer) request.getSession().getAttribute("id"));
				request.setAttribute("mydata", dto);
			}
		}
		
		chain.doFilter(req, res);
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}