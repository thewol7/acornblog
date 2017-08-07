<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Acorn Blog - HOME</title>
	<jsp:include page="/resources/resources.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/resources/nav.jsp"></jsp:include>
<div class="content">
	<h3>aaa님의 페이지입니다.</h3>
  <div class="divline"></div>
  <div class="main-profile">
    <c:choose>
	  	<c:when test="${empty info.profile_img }">
	  		<img src="${pageContext.request.contextPath }/resources/images/default.png" /> 
	  	</c:when>
	  	<c:otherwise>
  			<img src="${info.profile_img }" />
  		</c:otherwise>
  	</c:choose>
    <h4>이름: 페이지주인test(${info.name })</h4>
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
    <thead>
      <th><h4>번호</h4></th>
      <th><h4>제목</h4></th>
      <th><h4>작성자</h4></th>
      <th><h4>작성일</h4></th>
    </thead>
    <tbody>
      <tr>
        <td><h4>1</h4></td>
        <td><h4><a href="javascript:">최근에 쓴 게시글 5개</a></h4></td>
        <td><h4>aaa</h4></td>
        <td><h4>2017-08-03</h4></td>
      </tr>
      <tr>
        <td><h4>2</h4></td>
        <td><h4><a href="javascript:">최근에 쓴 게시글 5개</a></h4></td>
        <td><h4>aaa</h4></td>
        <td><h4>2017-08-03</h4></td>
      </tr>
      <tr>
        <td><h4>3</h4></td>
        <td><h4><a href="javascript:">최근에 쓴 게시글 5개</a></h4></td>
        <td><h4>aaa</h4></td>
        <td><h4>2017-08-03</h4></td>
      </tr>
      <tr>
        <td><h4>4</h4></td>
        <td><h4><a href="javascript:">최근에 쓴 게시글 5개</a></h4></td>
        <td><h4>aaa</h4></td>
        <td><h4>2017-08-03</h4></td>
      </tr>
      <tr>
        <td><h4>5</h4></td>
        <td><h4><a href="javascript:">최근에 쓴 게시글 5개</a></h4></td>
        <td><h4>aaa</h4></td>
        <td><h4>2017-08-03</h4></td>
      </tr>
    </tbody>
  </table>
  <h3>최근 사진</h3>
  <div class="divline"></div>
  <div class="pics">
    <div class="pic">
      <a href="picboard/picboardlist.do" style="background-image:url(${pageContext.request.contextPath }/resources/images/img1.jpg);"></a>
      <h3>사진의 제목</h3>
    </div>
    <div class="pic">
      <a href="javascript:" style="background-image:url(${pageContext.request.contextPath }/resources/images/img2.JPG);"></a>
      <h3>이렇게 이쁘게</h3>
    </div>
    <div class="pic">
      <a href="javascript:" style="background-image:url(${pageContext.request.contextPath }/resources/images/img3.jpg);"></a>
      <h3>뜨지롱</h3>
    </div>
    <div class="pic">
      <a href="javascript:" style="background-image:url(${pageContext.request.contextPath }/resources/images/img4.jpg);"></a>
      <h3>ㅎㅎ</h3>
    </div>
  </div>
  <h3>최근 방명록</h3>
  <div class="divline"></div>
  <table class="board-table">
    <colgroup>
      <col width="20%">
      <col width="50%">
      <col width="30%">
    </colgroup>
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
      <tr>
        <td>
          <h4><a href="javascript:">아무개</a></h4>
        </td>
        <td>
          <h4>잘 지내냐</h4>
        </td>
        <td>
          <h4>2017-08-03</h4>
        </td>
      </tr>
      <tr>
        <td>
          <h4><a href="javascript:">기지개</a></h4>
        </td>
        <td>
          <h4>이렇게</h4>
        </td>
        <td>
          <h4>2017-08-03</h4>
        </td>
      </tr>
      <tr>
        <td>
          <h4><a href="javascript:">지우개</a></h4>
        </td>
        <td>
          <h4>방명록이</h4>
        </td>
        <td>
          <h4>2017-08-03</h4>
        </td>
      </tr>
      <tr>
        <td>
          <h4><a href="javascript:">무지개</a></h4>
        </td>
        <td>
          <h4>최대</h4>
        </td>
        <td>
          <h4>2017-08-03</h4>
        </td>
      </tr>
      <tr>
        <td>
          <h4><a href="javascript:">미친개</a></h4>
        </td>
        <td>
          <h4>다섯개까지</h4>
        </td>
        <td>
          <h4>2017-08-03</h4>
        </td>
      </tr>
    </tbody>
  </table>
</div>
</body>
</html>