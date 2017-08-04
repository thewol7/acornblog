<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="nav">
  <div class="profile"><img src="logo.png" /></div>
  <div class="owner"></div>
  <ul>
    <li><a href="${pageContext.request.contextPath }/">HOME</a></li>
    <li class="dropdown-toggle"><a href="javascript:">BOARD</a></li>
      <ul class="dropdown-menu">
        <li><a href="board.html">PRIVATE BOARD</a></li>
        <li><a href="javascript:">PICTURE BOARD</a></li>
        <li><a href="javascript:">VISIT BOARD</a></li>
      </ul>
    <li><a href="javascript:">OTHERS</a></li>
      <c:choose>
      	<c:when test="${empty id }">
		    <li class="visible-lg"><a href="javascript:">로그인</a></li>
		    <li class="visible-lg"><a href="javascript:">회원가입</a></li>
	    </c:when>
	    <c:otherwise>
	    	<li class="dropdown-toggle"><a href="javascript:">MY PAGE</a></li>
		      <ul class="dropdown-menu">
		        <li><a href="javascript:">내 블로그</a></li>
		        <li><a href="javascript:">개인정보 관리</a></li>
		        <li><a href="javascript:">설정</a></li>
		      </ul>
	    	<li class="visible-lg"><a href="javascript:">로그아웃</a></li>
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
		    <li><a href="javascript:">로그인</a></li>
		    <li><a href="javascript:">회원가입</a></li>
	    </c:when>
	    <c:otherwise>
	    	<li><a href="javascript:">MY PAGE</a></li>
	    	<li><a href="javascript:">로그아웃</a></li>
	    </c:otherwise>
      </c:choose>
  </ul>
</div>
<div class="rbox">
	<c:choose>
      	<c:when test="${empty id }">
		    <h3><a href="javascript:">로그인</a> | <a href="javascript:">회원가입</a></h3>
	    </c:when>
	    <c:otherwise>
	    	<h3><a href="javascript:">로그아웃</a></h3>
	    </c:otherwise>
      </c:choose>
  
  <a class="collapsebox" href="javascript:collapse()">
    <div class="bar"></div>
  </a>
</div>