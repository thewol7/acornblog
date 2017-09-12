<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>acornblog</title>
  <jsp:include page="/resources/resources.jsp"></jsp:include>

</head>
<body>

<jsp:include page="/resources/nav.jsp"></jsp:include>
<div class="content">
  <h3>${info.name }님의 페이지입니다.</h3>
  <div class="divline"></div>
  <div class="main-profile">
  	<%-- ${info.profile_img } --%>
  	<c:choose>
	  	<c:when test="${empty info.profile_img }">
	  		<img src="${pageContext.request.contextPath }/resources/images/icons/default.png" /> 
	  	</c:when>
	  	<c:otherwise>
  			<img src="${info.profile_img }" />
  		</c:otherwise>
  	</c:choose>
    <h4>이름: 페이지주인(${info.name })</h4>
    <h4>성별: ${info.gender }</h4>
    <h4>이메일: ${info.email }</h4>
    <h4>등등등 </h4>
  </div>
  <h3>최근 게시글</h3>
  <div class="divline"></div>
  <table class="board-table">
    <colgroup>
      <col width="15%">
      <col width="35%">
      <col width="25%">
      <col width="25%">
    </colgroup>
    <c:choose>
    	<c:when  test="${not empty priDto}">
    		
		    <thead>
		      <th><h4>번호</h4></th>
		      <th><h4>제목</h4></th>
		      <th><h4>작성자</h4></th>
		      <th><h4>작성일</h4></th>
		    </thead>
		    <tbody>
		    <c:forEach var="tmp" items="${priDto }" begin="0" end="4">
		      <tr>
		        <td><h4>${tmp.cont_id }</h4></td>
		        <td><h4><a href="${pageContext.request.contextPath }/board/priboarddetail.do?cont_id=${tmp.cont_id}">${tmp.content_title }</a></h4></td>
		        <td><h4>${tmp.name}</h4></td>
		        <td><h4>${tmp.content_date }</h4></td>
		      </tr>
		     </c:forEach> 
		    </tbody>
		  	</table>
  	</c:when>
  	<c:otherwise>
  		<br /><br />
  		<h4 style="text-align:center;">글 목록이 없습니다.</h4>
  	</c:otherwise>
  	</c:choose>
  	
  <h3>최근 사진</h3>
  <div class="divline"></div>
  <div class="pics">
  <c:choose>
   <c:when  test="${not empty picDto}">
  	<c:forEach var="tmp" items="${picDto}" begin="0" end="3">
	    <div class="pic">
	      <a href="${pageContext.request.contextPath }/picboard/picboarddetail.do?cont_id=${tmp.cont_id}"
	      	 style="background-image:url(${tmp.pic});"></a>
	      <h3>${tmp.content_title }</h3>
	    </div>
    </c:forEach>
   </c:when>
   
   <c:otherwise>
  	<h4>사진이 없습니다.</h4>
   </c:otherwise>
  </c:choose>
  </div>
  <h3>최근 방명록</h3>
  <div class="divline"></div>
  <table class="board-table">
    <colgroup>
      <col width="20%">
      <col width="50%">
      <col width="30%">
    </colgroup>
    <c:choose>
    <c:when test="${not empty visDto}">
	    <thead>
	      <th>
	        <h4>글쓴이</h4>
	      </th>
	      <th>
	        <h4>내용</h4>
	      </th>
	      <th>
	        <h4>작성일</h4>
	      </th>
	    </thead>
	    
    	<tbody>
    	<c:forEach var ="tmp" items="${visDto}" begin="0" end="4" >
	      <tr>
		        <td>
		          <h4><a href="${pageContext.request.contextPath}/visitboard/list.do?page_id=${tmp.writer_id}">${tmp.name}</a></h4>
		        </td>
		        <td>
		          <h4>${tmp.content}</h4>
		        </td>
		        <td><h4>${tmp.content_date }</h4></td>
	      </tr>
	      </c:forEach>
	    </tbody>
    </c:when>
    <c:otherwise>
    	<h4>방명록이 없습니다.</h4>
    </c:otherwise>
    </c:choose>
  
  </table>
</div>
</body>
</html>






