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
<jsp:include page="/resources/nav.jsp"></jsp:include>
<div class="content">
<h3>${hostnamedto.name}님의 방명록</h3>
<div class="divline"></div>

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
<form class="wform vform" action="insert.do" method="post" id="inputform">
<h4>${writernamedto.name}: </h4><input class="wcon" type="text" name="content" id="content"/>
<button class="submitbtn" type="submit" id="contentBtn">등록</button>
</form>
</c:otherwise>	

</c:choose>

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
				<td><c:if test="${id == tmp.user_id}"><a class="delbtn" href="delete.do?cont_id=${tmp.cont_id } ">삭제</a></c:if></td>
			</tr>	
		</c:forEach>
		</c:if>
	</tbody>
</table>
<div class="page_display">
<ul class="paging">
	<c:choose>
		<c:when test="${startPageNum ne 1 }"><!-- 보는페이지가 1페이지이아니면(not equals) -->
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

</div>
<script>

$("#inputform").submit(function(){

	if($("#content").val()==''){
		return false;
	};
});

</script>
</body>
</html>