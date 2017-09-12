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

		<h3>${userdata.name} 님의 Blog</h3>
		<div class="divline"></div>

		<div class="row">
			
			<h3>${dto.content_title}</h3>
			<p style="overflow:auto;">${dto.content_content}</p>

			<!-- Break -->
			<c:if test="${mydata.id eq userdata.id}">
				<span><a class="upbtn" href="${pageContext.request.contextPath}/picboard/picboardupdateform.do?cont_id=${cont_id}">수정하기</a></span>
				<span><a class="delbtn" href="${pageContext.request.contextPath}/picboard/picboarddelete.do?cont_id=${cont_id}">삭제하기</a></span>
			</c:if>
			<button type="button" class="backbtn" onclick="location.href='${pageContext.request.contextPath}/picboard/picboardlist.do'">돌아가기</button>				
			
			<!-- 덧글 -->
	         <div class="comments">
	            <c:forEach var="tmp" items="${commentList}">
	               <div class="comment" <c:if test="${tmp.num ne tmp.comment_group }">style="margin-left:100px"</c:if> >   
	                  <c:if test="${tmp.num ne tmp.comment_group }">
	                     <div class="reply_icon"></div>
	                  </c:if>
	                  <div>      
	                     <strong>from ${tmp.name }</strong>
	                     ${tmp.regdate }<br/>
	                  </div>
	                  <textarea rows="5" disabled>${tmp.content}</textarea><br/>
	                  <a class="delBtn" href="${pageContext.request.contextPath}/picboard/piccommentdelete.do?num=${tmp.num }&cont_id=${tmp.ref_group}">삭제</a>
	               </div>
	               
	            </c:forEach>
	         
	            <div class="comment_form">
	            	<c:if test="${not empty id }">
	               <form class="wform vform" action="${pageContext.request.contextPath}/picboard/comment_insert.do?cont_id=${dto.cont_id }" method="post">
	                  <!-- 덧글 작성자 -->
	                  <input type="hidden" name="writer" value="${id}"/>
	                  <h4>${mydata.name}: </h4>
	                  <!-- 덧글 그룹 -->
	                  <!-- <textarea name="content" style="resize:none"></textarea> -->
	                  <input type="text" class="wcon" name="content" />
	                  <button type="submit">등록</button>
	               </form>
	               </c:if>
	            </div>
	         </div>
		</div>	
	</div>
</body>
</html>