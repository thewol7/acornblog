<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
	<h3>${dto.content_title }</h3>
	<div class="divline"></div>
	<div class="row">
		<form class="wform" action="#">
			<textarea name="content_content" id="" cols="30" rows="10" class="wcon" disabled="disabled" style="resize:none; box-sizing:border-box;" >${dto.content_content }</textarea>
		</form>
	<c:if test="${dto.user_id eq id}">
	<a class="delbtn" href="${pageContext.request.contextPath }/board/priboarddelete.do?cont_id=${dto.cont_id}">삭제</a>
	<a class="upbtn" href="${pageContext.request.contextPath }/board/priboardupdateform.do?cont_id=${dto.cont_id}">수정</a>
	</c:if>
	         <!-- 덧글 -->
         <div class="comments">
            <c:forEach var="tmp" items="${commentlist }">
               <div class="comment" <c:if test="${tmp.num ne tmp.comment_group }">style="margin-left:100px"</c:if> >   
                  <c:if test="${tmp.num ne tmp.comment_group }">
                     <div class="reply_icon"></div>
                  </c:if>
                  <div>      
                     <strong>from ${tmp.name }</strong>
                     ${tmp.regdate }<br/>
                  </div>
                  <textarea rows="5" disabled>${tmp.content}</textarea><br/>
                  <a class="delBtn" href="pricommentdelete.do?num=${tmp.num }&cont_id=${tmp.ref_group}">삭제</a>
               </div>
               
            </c:forEach>
         
            <div class="comment_form">
            	<c:if test="${not empty id }">
               <form class="wform vform" action="pricommentinsert.do?cont_id=${dto.cont_id }" method="post">
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
<script>
	${".delbtn"}.click(function(){
		location.href="${pageContext.request.contextPath}/board/priboarddelete?cont_id=${dto.cont_id}";
	});
	${".upbtn"}.click(function(){
		location.href="${pageContext.request.contextPath}/board/priboardupdateform?cont_id=${dto.cont_id}";
	});
</script>
</body>
</html>