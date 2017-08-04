<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<<<<<<< HEAD
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>views/home.jsp</title>
=======
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>acornblog</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/acornblog.min.css">
>>>>>>> branch 'master' of https://github.com/thewol7/acornblog
</head>
<body>
<<<<<<< HEAD
<h3>인덱스 페이지 입니다.</h3>

<h3>공지 사항 입니다.</h3>

=======
<div class="nav">
  <div class="profile"><img src="${pageContext.request.contextPath }/resources/images/logo.png" /></div>
  <div class="owner">aaa</div>
  <ul>
    <li><a href="javascript:">HOME</a></li>
    <li class="dropdown-toggle"><a href="javascript:">BOARD</a></li>
      <ul class="dropdown-menu">
        <li><a href="javascript:">PRIVATE BOARD</a></li>
        <li><a href="javascript:">PICTURE BOARD</a></li>
        <li><a href="javascript:">VISIT BOARD</a></li>
      </ul>
    <li><a href="javascript:">OTHERS</a></li>
    <li class="dropdown-toggle"><a href="javascript:">MY PAGE</a></li>
      <ul class="dropdown-menu">
        <li><a href="javascript:">내 블로그</a></li>
        <li><a href="javascript:">개인정보 관리</a></li>
        <li><a href="javascript:">설정</a></li>
      </ul>
    <li class="visible-lg"><a href="javascript:">로그인</a></li>
    <li class="visible-lg"><a href="javascript:">회원가입</a></li>
  </ul>
</div>
<div class="backdrop">
  <ul>
    <li><a href="javascript:">HOME</a></li>
    <li><a href="javascript:">BOARD</a></li>
    <li><a href="javascript:">OTHERS</a></li>
    <li><a href="javascript:">MY PAGE</a></li>
    <li><a href="javascript:">로그인</a></li>
    <li><a href="javascript:">회원가입</a></li>
  </ul>
</div>
<div class="rbox">
  <h3><a href="javascript:">로그인</a> | <a href="javascript:">회원가입</a></h3>
  <a class="collapsebox" href="javascript:collapse()">
    <div class="bar"></div>
  </a>
</div>
<div class="content">
  <h3>aaa님의 페이지입니다.</h3>
  <div class="divline"></div>
  <div class="main-profile">
    <img src="${pageContext.request.contextPath }/resources/images/logo.png" />
    <h4>이름: aaa</h4>
    <h4>성별: </h4>
    <h4>이메일: </h4>
    <h4>등등등</h4>
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
      <a href="javascript:" style="background-image:url(${pageContext.request.contextPath }/resources/images/img1.jpg);"></a>
      <h2>사진의 제목</h2>
    </div>
    <div class="pic">
      <a href="javascript:" style="background-image:url(${pageContext.request.contextPath }/resources/images/img2.JPG);"></a>
      <h2>이렇게 이쁘게</h2>
    </div>
    <div class="pic">
      <a href="javascript:" style="background-image:url(${pageContext.request.contextPath }/resources/images/img3.jpg);"></a>
      <h2>뜨지롱</h2>
    </div>
    <div class="pic">
      <a href="javascript:" style="background-image:url(${pageContext.request.contextPath }/resources/images/img4.jpg);"></a>
      <h2>ㅎㅎ</h2>
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
<script
src="https://code.jquery.com/jquery-3.2.1.js"
integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/js/acornblog.js"></script>
>>>>>>> branch 'master' of https://github.com/thewol7/acornblog
</body>
</html>






