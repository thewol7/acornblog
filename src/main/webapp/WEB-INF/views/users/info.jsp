<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인정보</title>
</head>
<style>
img {
  width: 150px;
  height: 150px;
}
</style>
<body>
<h3>개인정보관리.</h3>
<a href="${pageContext.request.contextPath }/home.do">홈으로</a>
<table>
	<thead>
		<tr>
			<th>항목</th>
			<th>정보</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>아이디</th>
			<td>${session.id }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${session.name }</td>
		</tr>
		<tr>
			<th>휴대폰</th>
			<td>${session.phone }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${session.email }</td>
		</tr>
		<tr>
			<th>프로필 이미지</th>
			<td><img src="${session.profile_img }" alt="" /></td>
		</tr>
		<tr>
			<th>프로필 소개</th>
			<td><textarea readonly="readonly" name="profile_cmt" id="profile_cmt"
						rows="5" maxlength="100">${session.profile_cmt }</textarea>
			</td>
		</tr>
	</tbody>
</table>
<a href="updateform.do">가입정보 수정</a><br />
</body>
</html>