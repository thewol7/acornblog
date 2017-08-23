<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<jsp:include page="/resources/resources.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/resources/nav.jsp"></jsp:include>
<div class="content">
<h3>로그인</h3>
<div class="divline"></div>
<form class="wform hform" action="signin.do?url=${param.url}" method="post">
	<input class="wcon" type="text" name="id" id="id" placeholder="아이디"/><br/>
	<input class="wcon" type="password" name="pwd" id="pwd" placeholder="비밀번호"/><br/>
	<button class="submitbtn" type="submit">로그인</button>
</form>
</div>
</body>
</html>








