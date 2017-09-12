<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>others/userlist</title>
<jsp:include page="/resources/resources.jsp"></jsp:include>
</head>
<body>

<jsp:include page="/resources/nav.jsp"></jsp:include>

<div class="content">
<h3>회원 목록</h3>
<div class="divline"></div>
<c:choose>
	<c:when test="${not empty userList }">
	<table class="board-table">
	<thead>
		<tr>
			<th><h4>회원 이름</h4></th>
			<th><h4>이메일</h4></th>
			<th><h4>성별</h4></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="tmp" items="${userList}">
			<tr>
				<td><a href="${pageContext.request.contextPath}/home.do?page_id=${tmp.user_id}"><h4>${tmp.name}</h4></a></td>
				<td><h4>${tmp.email}</h4></td>
				<td><h4>${tmp.gender}</h4></td>	
			</tr>	
		</c:forEach>
	</tbody>
</table>
	</c:when>
	<c:otherwise>
		<h3>회원이 아무도 없습니다.</h3>
	</c:otherwise>
</c:choose>
</div>
</body>
</html>