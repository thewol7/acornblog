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
			<c:if test="${dto.prevNum ne 0 }">
				<a href="picboarddetail.do?cont_id=${dto.prevNum }">이전글</a> |
			</c:if>
			<c:if test="${dto.nextNum ne 0 }">
				<a href="picboarddetail.do?cont_id=${dto.nextNum }">다음글</a>
			</c:if>
			
			<h3>${dto.content_title}</h3>
			<p>${dto.content_content}</p>

	
			<!-- Break -->
			<c:if test="${id eq page_id}">
				<span><a class="upbtn" href="picboardupdateform.do?cont_id=${cont_id }">수정하기</a></span>
				<span><a class="delbtn" href="picboarddelete.do?cont_id=${cont_id }">삭제하기</a></span>
			</c:if>
			<button type="button" class="backbtn" onclick="location.href='picboardlist.do'">돌아가기</button>				

			<!-- 덧글 -->
			<div class="comments">
				<c:forEach var="tmp" items="${commentList }">
					<div class="comment" <c:if test="${tmp.num ne tmp.comment_group }">style="margin-left:100px"</c:if> >	
						<c:if test="${tmp.num ne tmp.comment_group }">
							<div class="reply_icon"></div>
						</c:if>
						<div>		
							<strong>from ${tmp.writer }</strong>
							${tmp.regdate }<br/>
							<a href="javascript:">답글</a>
						</div>
						<textarea rows="5" disabled>${tmp.content}</textarea><br/>
						<form action="comment_insert.do" method="post">
							<!-- 덧글 작성자 -->
							<input type="hidden" name="writer" value="${info.name}"/>
							<!-- 덧글 그룹 -->
							<input type="hidden" name="ref_group" value="${dto.num}" />
							<input type="hidden" name="comment_group" value="${tmp.comment_group}" />
							<textarea name="content"></textarea>
							<button type="submit" class="submitbtn">등록</button>
						</form>
					</div>
					
				</c:forEach>
			
				<div class="comment_form">
					<form action="comment_insert.do" method="post">
						<!-- 덧글 작성자 -->
						<input type="hidden" name="writer" value="${id}"/>
						<!-- 덧글 그룹 -->
						<textarea name="content" style="resize:none"></textarea>
						<button type="submit">등록</button>
					</form>
				</div>
			</div>
		</div>	
	</div>
</body>
</html>