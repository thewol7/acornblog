<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
			<c:choose>
				<c:when test="${empty id}">
			<li>
				<a href="${pageContext.request.contextPath }/loginform.do">
					<span class="">로그인</span>
				</a>
				</li>
				</c:when>
				<c:otherwise>
			<li>
				<a href="${pageContext.request.contextPath }/logout.do">
					<span class="">로그아웃</span>
				</a>
			</li>
				</c:otherwise>
			</c:choose>
				<section style="padding-top:2em">
				<div class="row">
					<div class="6u 6u(small)">
						<h2 class="h-header">게시판</h2> <%--  / id : ${id } / page_id : ${page_id } --%>
					</div>
				<c:if test="${ id eq page_id  }">
					<div class="6u 6u(small)" style="text-align: right">
						<h4>
							<a href="${pageContext.request.contextPath }/views/board/boardwriteform.do"
								class="button special" onclick="return loginChk()">새글쓰기</a>
						</h4>
					</div>
				</c:if>	
				</div>
				<div class="table-wrapper">
					<ul class="alt">
						<li></li>
						<li style="border-top: 2px solid black"></li>
					</ul>
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="tmp" items="${data}">
							<tr>
								<td>${tmp.cont_id }</td>
								<td>
									<!--  style="text-align:left" --> <a
										href="boarddetail.do?cont_id=${tmp.cont_id}"
										class="icon">
										${tmp.content_title }</a>
								</td>
								<td>${info.name }</td>
								<td>${tmp.content_date }</td>
								<td>${tmp.view_count }</td>
							</tr>
						</c:forEach> 
						</tbody>
					</table>
					<ul class="pagination" style="text-align: center">
					<c:choose>
					<c:when test="${startPageNum eq 1 }">
						<li>
							<span class="button disabled">Prev</span>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<span href="boardlist.do?pageNum=${startPageNum-1 }" class="button disabled">Prev</span>
						</li>
					</c:otherwise>
					</c:choose>	
					<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
						<c:choose>
							<c:when test="${i eq pageNum }">
							<li>
								<a class="page active" href="boardlist.do?pageNum=${i}">${i}</a>
							</li>
							</c:when>
							<c:otherwise>
							<li>
								<a class="page"	href="boardlist.do?pageNum=${i}">${i}</a>
							</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${endPageNum eq totalPageCount }">
							<span class="button disabled">Next</span>
						</c:when>
						<c:otherwise>
							<li>
								<a href="boardlist.do?pageNum=${endPageNum+1 }" class="button">Next</a>
							</li>
						</c:otherwise>
					</c:choose>	
					</ul>
				</div>

				</section>
			</div>
		</div>

</body>
</html>