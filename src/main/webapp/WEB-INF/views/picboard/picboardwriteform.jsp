<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
<title>Insert title here</title>
<jsp:include page="/resources/resources.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/resources/nav.jsp"></jsp:include>
	<!-- Wrapper -->
	<div class="content">
		<h3>${userdata.name} 님 사진추가중...</h3>
		<div class="divline"></div>
		
		<div class="row">		
			<form method="post" action="picboardwrite.do">
				<input class="wcon" type="text" name="content_title" id="title" value=""
							placeholder="제목" maxlength="50"/><!-- maxlength="50" -->

				<textarea name="ckContent" id="ckContent"
					placeholder="Enter your message" rows="20"></textarea>
				<script type="text/javascript">				
					/* 개인 키값 입력 */
					UPLOADCARE_PUBLIC_KEY = '07c3ee3ce257b7a7ce86';
					CKEDITOR.replace('ckContent', {								
					    uploadcare: {
					        multiple: true
					    }
					});
				</script>
				
				<!-- Break -->
				<input type="hidden" name="ckValue" id="ckValue" value="" />
				<button type="submit" onclick="return chkData()" id="submit" class="submitbtn" >확인</button>		
				<button class="backbtn" onclick="location.href='picboardlist.do'" type="button">돌아가기</button>
			</form>
		</div>
	</div> <!-- wrapper -->
</body>
<script>
	/* $("#submit").click(function(){ */
	function chkData(){
		/* onclick 이벤트 발생했을때 ckeditor 에 데이터를 확인함 */
		var ckData = CKEDITOR.instances.ckContent.getData();
		var findImg = "img";
			
		/* 데이터가 없을 경우 알람 띄우기 */
		if(CKEDITOR.instances.ckContent.getData().length < 1){
			alert("내용을 입력해 주세요");
			return false;
		/* img 문자가 있는지 여부를 확인(이미지 삽입 여부). 
		finxImg에 들어있는 문자열의 위치를 숫자로 알려주며 
		없을 경우 -1을 반환 한다..*/
		}else if(ckData.indexOf(findImg) != -1){
			/* 데이터가 있을 경우 데이터값을 input에 담아서 넘김 */
			document.getElementById("ckValue").value=ckData;
			if(document.getElementById("ckValue").value == null){
				alert("ckValue null!!");
				return false;
			}else{
				alert("이미지 저장 완료!");
				return true;
			}	
		}else{
			alert("이미지를 추가해주세요.");
			return false;
		}
	}
 /* });  */
</script>
</html>