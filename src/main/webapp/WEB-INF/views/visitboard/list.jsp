<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>views/visitboard/list.jsp</title>
<jsp:include page="/resources/resources.jsp"></jsp:include>
<style>
	.page_display a{
		text-decoration:none;
		color:#000;
	}
	.page_display a.active{
		font-weight:bold;
		color:red;
		text-decoration:underline;
	}
	.page_display a.muted{
		color:#cecece
	}

</style>
</head>
<body>
<h3>${hostnamedto.name}님의 페이지</h3>
<table>
	<thead>
		<tr>
			<th>작성자</th>
			<th>내용</th>
			<th>작성일</th>
			<th>삭제</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${not empty list}">
		<c:forEach var = "tmp" items="${list}">
			<tr>
				<th>${tmp.name }</th>
				<th>${tmp.content}</th>
				<th>${tmp.content_date}</th>
				<c:if test="${id == tmp.user_id}">
				<th><a href="delete.do?cont_id=${tmp.cont_id } ">삭제</a></th></c:if>
			</tr>	
		</c:forEach>
		</c:if>
	</tbody>
</table>
<div class="page_display">
<ul class="paging">
	<c:choose>
		<c:when test="${startPageNum ne 1 }"><!-- 보는페이지가 1페이지이아니면( not equals) -->
			<li><a class="navbtn prev" href="list.do?pageNum=${startPageNum-1 }">이전</a></li>
		</c:when>
		<c:otherwise>
			<li><a class="navbtn disabled" href="javascript:">이전</a> <!-- 1이면 mute(가림) --></li>
		</c:otherwise>
	</c:choose>

	<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
		<c:choose>
			<c:when test="${i eq pageNum }">
				<li><span>${i }</span></li>
				<!-- <a  class="active" href="list.do?pageNum=${i }">${i }</a> -->
			</c:when>
			<c:otherwise>
				<a href="list.do?pageNum=${i }">${i }</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:choose>
		<c:when test="${endPageNum lt totalPageCount }">
			<li><a class="navbtn next" href="list.do?pageNum=${endPageNum+1 }">다음</a></li>
		</c:when>
		<c:otherwise>
			<li><a class="navbtn disabled" href="javascript:">다음</a></li>
		</c:otherwise>
	</c:choose>
</ul>
</div>

<c:choose>
<c:when test="${empty writernamedto.name}">
	<script>
		if(confirm("로그인해야됨")){
			location.href="list.do"
		}else{
			return false;
		}
	</script>
</c:when>
<c:otherwise>
<form action="insert.do" method="post">
${writernamedto.name}<input type="text" name="content"/>
<button type="submit">등록</button>
</form>
</c:otherwise>	

</c:choose>
</body>
</html>