<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="nav">

  <div class="profile">
  <c:choose>
	  	<c:when test="${empty info.profile_img }">
	  		<img src="${pageContext.request.contextPath }/resources/images/icons/default.png" /> 
	  	</c:when>
	  	<c:otherwise>
  			<img src="${info.profile_img }" />
  		</c:otherwise>
  </c:choose>
  </div>
  <div class="owner">${info.name }</div>
  <ul>
    <li><a class="active" href="${pageContext.request.contextPath }/home.do">HOME</a></li>
    <li class="dropdown-toggle"><a href="javascript:">BOARD</a></li>

      <ul class="dropdown-menu">
        <li><a href="${pageContext.request.contextPath }/board/priboardlist.do?url=${pageContext.request.contextPath }">PRIVATE BOARD</a></li>
        <li><a href="${pageContext.request.contextPath }/picboard/picboardlist.do?url=${pageContext.request.contextPath }">PICTURE BOARD</a></li>
        <li><a href="${pageContext.request.contextPath}/visitboard/list.do?url=${pageContext.request.contextPath }">VISIT BOARD</a></li>

      </ul>
    <li><a href="javascript:">OTHERS</a></li>
    <li class="dropdown-toggle"><a href="javascript:">MY PAGE</a></li>
      <ul class="dropdown-menu">
        <li><a href="${pageContext.request.contextPath }/home.do?page_id=${id }">내 블로그</a></li>
        <li><a href="${pageContext.request.contextPath }/users/info.do">개인정보 관리</a></li>
        <li><a href="javascript:">설정</a></li>
      </ul>
    <c:choose>
      	<c:when test="${empty id }">
    <li class="visible-lg"><a href="${pageContext.request.contextPath }/users/signin_form.do?url=${pageContext.request.contextPath }">로그인</a></li>
    <li class="visible-lg"><a href="${pageContext.request.contextPath }/users/signup_form.do">회원가입</a></li>
    </c:when>
	    <c:otherwise>
	    <li class="visible-lg"><a href="${pageContext.request.contextPath }/users/signout.do?url=${pageContext.request.contextPath }">로그아웃</a></li>
	    </c:otherwise>
    </c:choose>
  </ul>
</div>
<div class="backdrop">
  <ul>
    <li><a class="active" href="${pageContext.request.contextPath }/home.do">HOME</a></li>
    <li><a href="${pageContext.request.contextPath }/board/priboardlist.do?url=${pageContext.request.contextPath }">BOARD</a></li>

    <li><a href="javascript:">OTHERS</a></li>
    <li><a href="${pageContext.request.contextPath }/home.do?page_id=${id }">MY PAGE</a></li>
    <c:choose>
      	<c:when test="${empty id }">
    <li><a href="${pageContext.request.contextPath }/users/signin_form.do?url=${pageContext.request.contextPath }">로그인</a></li>
    <li><a href="${pageContext.request.contextPath }/users/signup_form.do">회원가입</a></li>
    </c:when>
	    <c:otherwise>
	    <li><a href="${pageContext.request.contextPath }/users/signout.do?url=${pageContext.request.contextPath }">로그아웃</a></li>
	    </c:otherwise>
    </c:choose>
  </ul>
</div>
<div class="rbox">
	<c:choose>
      	<c:when test="${empty id }">
		  <h3><a href="${pageContext.request.contextPath }/users/signin_form.do?url=${pageContext.request.contextPath }">로그인</a> | <a href="javascript:">회원가입</a></h3>
		  </c:when>
	    <c:otherwise>
	    <h3><a href="${pageContext.request.contextPath }/users/signout.do?url=${pageContext.request.contextPath }">로그아웃- 로그인된계정test(${session.name })</a></h3>
	    
	    </c:otherwise>
      </c:choose>
		  <a class="collapsebox" href="javascript:collapse()">
    	<div class="bar"></div>
  	</a>
</div>