<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<title>Insert title here</title>
<style>
	.comments{
		margin-top:40px;
	}
</style>
<jsp:include page="/resources/resources.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/resources/nav.jsp"></jsp:include>
	<!-- Wrapper -->
	<div class="content">

		<h3>${info.name} 님의 Blog</h3>
		<div class="divline"></div>

		<div class="row">
			
			<h3>${dto.content_title}</h3>
			<p><img src="${dto.pic}" /></p>

	
			<!-- Break -->
			<c:if test="${id eq page_id}">
				<span><a class="upbtn" href="picboardupdateform.do?cont_id=${cont_id}">수정하기</a></span>
				<span><a class="delbtn" href="picboarddelete.do?cont_id=${cont_id}">삭제하기</a></span>
			</c:if>
			<button type="button" class="backbtn" onclick="location.href='picboardlist.do'">돌아가기</button>				

		</div>	
	</div>
</body>
</html>