<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>views/board/priboardlist</title>
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
<h3>${page_name}의 게시판 입니다.</h3>
<c:if test="${not empty list}">
<table class="board-table">
	<thead>
		<tr>
			<th><h4>글번호</h4></th>
			<th><h4>제목</h4></th>
			<th><h4>작성일</h4></th>
			<th><h4>조회수</h4></th>
		</tr>
	</thead>
	<tbody>
		
		<c:forEach var = "tmp" items="${list}">
			<tr>
				<td><h4>${tmp.cont_id }</h4></td>
				<td><h4><a href="${pageContext.request.contextPath }/board/priboarddetail.do?cont_id=${tmp.cont_id}">${tmp.content_title}</a></h4></td>
				<td><h4>${tmp.content_date}</h4></td>
				<td><h4>${tmp.view_count }</h4></td>
			</tr>	
		</c:forEach>
		
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
</c:if>
<c:if test="${empty list }">
			<h3>입력된 게시글이 없습니다.</h3>
</c:if>
<a class="wbtn" href="priboardinsertform.do">글쓰기</a>

</div>
<c:choose>
<c:when test="${empty writernamedto.name}">
	<script>
	
	
		if(confirm("로그인해야됨")){
			location.href="list.do"
		}else{
			return false;
		};
		$("#contentBtn").click(function(){
			location.href="priboardinsertform.do"
		});
		
	</script>
</c:when>
<c:otherwise>
<form action="insert.do" method="post">
${writernamedto.name}<input type="text" name="content" id="content"/>
<button type="submit" id="contentBtn">등록</button>
</form>
</c:otherwise>	

</c:choose>
</div>
<script>
$("contentBtn").on("submit",function(){
	if($("#content").val()==null){
		alert("내용쓰세요");
		return false;
	}
	
})
</script>
</body>
</html>