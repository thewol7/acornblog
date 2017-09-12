<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/resources/resources.jsp"></jsp:include>
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
<jsp:include page="/resources/nav.jsp"></jsp:include>
	<!-- Wrapper -->
	<div class="content">
	
	<h3>${userdata.name} 님 수정중...</h3>
	<div class="divline"></div>
		<div class="row">
			<form method="post" action="picboardupdate.do?cont_id=${cont_id}">
				<input class="wcon" type="text" name="content_title" id="title" value="${dto.content_title}"
						placeholder="제목" maxlength="50"/>
				
					<textarea name="ckContent" id="ckContent" placeholder="content"
						rows="20" value="">${dto.content_content}</textarea>
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
				<button type="submit" onclick="return chkData()" id="submit" class="submitbtn" >확인</button>
				<button type="button" class="backbtn" onclick="location.href='picboardlist.do'">돌아가기</button>
			</form>
		</div>
	</div>
<script>
	
	/* $("#submit").click(function(){ */
		function chkData(){
			/* onclick 이벤트 발생했을때 ckeditor 에 데이터를 확인함 */
			var ckData = CKEDITOR.instances.ckContent.getData();
			
			/* if(ckData == null){
				alert("ckData null");
			}else{
				alert("ckData:"+ckData);	
			} */
				
			/* 데이터가 없을 경우 알람 띄우기 */
			if(CKEDITOR.instances.ckContent.getData().length < 1){
				alert("내용을 입력해 주세요");
				return false;
			}else{
				/* 데이터가 있을 경우 데이터값을 input에 담아서 넘김 */
				/* document.form1.ckInput.value=ckData; */
				document.getElementById("ckValue").value=ckData;
				if(document.getElementById("ckValue").value == null){
					alert("ckValue null!!");
					return false;
				}else{
					alert("수정 완료했습니다!");
					return true;
				}	
			}
		}
</script>
</body>
</html>