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
		<form class="wform" action="priboardinsert.do">
			<input type="text" name="content_title" placeholder="제목" />
			<div class="divline"></div>
				<textarea name="content_content" id="" cols="30" rows="10" class="wcon" style="resize:none; box-sizing:border-box;" placeholder="내용을 적어주세요">
				
				</textarea>
			<button type="submit">글쓰기</button>
		</form>
	   
         
            </div>
         </div>
	</div>
</div>

</body>
</html>