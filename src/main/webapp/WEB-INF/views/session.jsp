<%@page import="com.acorn.blog.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% UsersDto dto = new UsersDto();
	dto.setUser_id(1);
	session.setAttribute("id",dto.getUser_id());	
	dto.setUser_id(1);
	session.setAttribute("page_id",dto.getUser_id());
response.sendRedirect("home.do");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>views/session.jsp</title>
</head>
<body>

</body>
</html>