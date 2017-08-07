<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="nav">
  <div class="profile">
  	 <c:choose>
	  	<c:when test="${empty info.profile_img }">
	  		<img src="${pageContext.request.contextPath }/resources/images/default.png" /> 
	  	</c:when>
	  	<c:otherwise>
  			<img src="${info.profile_img }" />
  		</c:otherwise>
  	</c:choose>
  </div>
  <div class="owner"></div>
  <ul>
    <li><a href="${pageContext.request.contextPath }/">HOME</a></li>
    <li class="dropdown-toggle"><a href="javascript:">BOARD</a></li>
      <ul class="dropdown-menu">
        <li><a href="board.html">PRIVATE BOARD</a></li>
        <li><a href="javascript:">PICTURE BOARD</a></li>
        <li><a href="visitboard/list.do">VISIT BOARD</a></li>
      </ul>
    <li><a href="javascript:">OTHERS</a></li>
      <c:choose>
      	<c:when test="${empty id }">
		    <a href="users/signin_form.do?url=${pageContext.request.contextPath }">로그인</a>
		    <a href="users/signup_form.do">회원가입</a>
	    </c:when>
	    <c:otherwise>
	    	<li class="dropdown-toggle"><a href="javascript:">MY PAGE</a></li>
		      <ul class="dropdown-menu">
		        <li><a href="javascript:">내 블로그</a></li>
		        <li><a href="javascript:">개인정보 관리</a></li>
		        <li><a href="javascript:">설정</a></li>
		      </ul>
	    	<a href="users/signout.do?url=${pageContext.request.contextPath }">로그아웃-로그인된계정test(${session.name })</a>
	    </c:otherwise>
      </c:choose>
  </ul>
</div>
<div class="backdrop">
  <ul>
    <li><a href="${pageContext.request.contextPath }/">HOME</a></li>
    <li><a href="javascript:">BOARD</a></li>
    <li><a href="javascript:">OTHERS</a></li>
    <c:choose>
      	<c:when test="${empty id }">
		    <a href="users/signin_form.do?url=${pageContext.request.contextPath }">로그인</a>
		    <a href="users/signup_form.do">회원가입</a>
	    </c:when>
	    <c:otherwise>
	    	<li><a href="javascript:">MY PAGE</a></li>
	    	<a href="users/signout.do?url=${pageContext.request.contextPath }">로그아웃- 로그인된계정test(${session.name })</a>
	    </c:otherwise>
      </c:choose>
  </ul>
</div>
<div class="rbox">
	<c:choose>
      	<c:when test="${empty id }">
		    <a href="users/signin_form.do?url=${pageContext.request.contextPath }">로그인</a> | <a href="users/signup_form.do">회원가입</a>
	    </c:when>
	    <c:otherwise>
	    	<a href="users/signout.do?url=${pageContext.request.contextPath }">로그아웃- 로그인된계정test(${session.name })</a>
	    </c:otherwise>
      </c:choose>

  <a class="collapsebox" href="javascript:collapse()">
    <div class="bar"></div>
  </a>
</div>