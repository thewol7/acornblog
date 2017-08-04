<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>views/visitboard/list.jsp</title>
</head>
<body>
<h3>${hostnamedto.name}님의 페이지</h3>
<table>
	<thead>
		<tr>
			<th>작성자</th>
			<th>내용</th>
			<th>작성일</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${not empty list}">
		<c:forEach var = "tmp" items="${list}">
			<tr>
				<th>${tmp.name }</th>
				<th>${tmp.content}</th>
				<th>${tmp.content_date}</th>
			</tr>	
		</c:forEach>
		</c:if>
	</tbody>
</table>
<c:if test="${empty writernamedto.name}">
	<script>
		if(confirm("로그인해야됨")){
			location.href="list.do"
		}else{
			return false;
		}
	</script>
</c:if>
<c:otherwise>
<form action="list.do" method="post">
${writernamedto.name}<input type="text" name="content"/>
<button type="submit">등록</button>
</form>
</c:otherwise>	
</body>
</html>