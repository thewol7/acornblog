<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="board-table">
	<thead>
		<tr>
			<th><h4>작성자</h4></th>
			<th><h4>내용</h4></th>
			<th><h4>작성일</h4></th>
			<th><h4>삭제</h4></th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${not empty list}">
		<c:forEach var = "tmp" items="${list}">
			<tr>
				<td><h4>${tmp.name }</h4></td>
				<td><h4>${tmp.content}</h4></td>
				<td><h4>${tmp.content_date}</h4></td>
				<c:if test="${id == tmp.user_id}">
				<td><a class="delbtn" href="delete.do?cont_id=${tmp.cont_id } ">삭제</a></td></c:if>
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
</body>
</html>