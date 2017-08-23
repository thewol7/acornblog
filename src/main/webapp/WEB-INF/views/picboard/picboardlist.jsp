<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<title>Insert title here</title>
<jsp:include page="/resources/resources.jsp"></jsp:include>
</head>
<style>
</style>
<body>
<jsp:include page="/resources/nav.jsp"></jsp:include>
	<!-- Wrapper -->
	<div class="content">


	<h3>${info.name}님의 사진첩</h3>
	<div class="divline"></div>
	
	<a href="picboardwriteform.do" class="wbtn">새글쓰기</a>
	
	<div class="row">
		<c:if test="${!empty data }">
			<c:forEach var="tmp" items="${data}">
				<li><a href="picboarddetail.do?cont_id=${tmp.cont_id}"><img src="${tmp.pic}" /></a></li>
			</c:forEach>
		</c:if>
		<c:if test="${empty data }">
			<h3>입력된 게시글이 없습니다.</h3>
		</c:if>
	</div>
	
	<ul class="paging">
		<c:choose>
			<c:when test="${startPageNum ne 1 }">
				<li>
					<a class="navbtn prev" href="picboardlist.do?pageNum=${startPageNum-1 }">&laquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li>
					<a class="navbtn prev disabled" href="javascript:">&laquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
		
		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
			<c:choose>
				<c:when test="${i eq pageNum }">
					<li>
						<span>${i }</span>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<a class="pages" href="picboardlist.do?pageNum=${i }">${i }</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:choose>
			<c:when test="${endPageNum lt totalPageCount }">
				<li>
					<a class="navbtn next" href="picboardlist.do?pageNum=${endPageNum+1 }">&raquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li>
					<a class="navbtn next disabled" href="javascript:">&raquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
	</ul>
	
	</div>
</body>
</html>