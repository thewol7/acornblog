<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ucarecdn.com/libs/widget/3.1.0/uploadcare.full.min.js" charset="utf-8"></script>
<title>views/users/signup_form.jsp</title>
<style>
.image-preview-single {
    width: 150px;
    height: 150px;
    overflow: hidden;
    /* webkit-border-radius: 10%;
    -moz-border-radius: 10%;
    -ms-border-radius: 10%;
    -o-border-radius: 10%;
    border-radius: 10%; */
}

.image-preview-single > img {
  width: 150px;
  height: 150px;
  vertical-align: middle;
  display: inline-block;
  cursor: pointer;
}

div.uploadcare--progress, div.uploadcare--progress_type_canvas{
	position : relative;
}
.uploadcare--progress__canvas{
	position: absolute;
	width: 40px;
	height: 40px;
	top: -350%;
	right:-230%;
}

.uploadcare--widget__button_type_open, 
.uploadcare--widget uploadcare--widget_option_clearable, 
.uploadcare--widget_status_loaded,
.uploadcare--widget__text,
.uploadcare--widget__button_type_cancel{
	display:none;
}
</style>
</head>
<body>
<h3>회원정보 수정</h3>
<a href="${pageContext.request.contextPath}/home.do">홈으로</a>
<form action="${pageContext.request.contextPath}/users/update.do" method="post" id="update_form" class="update_form">
	<input type="hidden" name="id" value="${mydata.id }"/>
		<div class="">
			<input type="text" name="id" id="id" placeholder="ID" disabled="disabled" value="${mydata.id }">
		</div>
		<div class="">
			<input type="password" name="pwd" id="pwd" placeholder="PASSWORD">
		</div>
		<div class="">
			<input type="password" name="pwd2" id="pwd2" placeholder="PASSWORD">
		</div>
		<div class="">
			<input type="text" name="name" id="name" placeholder="NAME" value="${mydata.name }">
		</div>
		<div class="">
			<input type="text" name="phone" id="phone" placeholder="PHONE" value="${mydata.phone }">
		</div>
		<div class="">
			<input type="email" name="email" id="email" placeholder="EMAIL" value="${mydata.email }">
		</div>
		<div class="4u input-reform-bottom">
			<div class="image-preview-single">
				<image id="profileImage"
					src="${mydata.profile_img }" />
				<input type="hidden" role="uploadcare-uploader" data-clearable=""
					data-images-only="">
				<input type="hidden" name="photo_value" id="photo_value" value="" />
				<script>
					UPLOADCARE_PUBLIC_KEY = '07c3ee3ce257b7a7ce86';
				</script>
			</div>
		</div>
		<div class="8u input-reform-bottom">
			<div id="profile-container">
				<textarea style="resize: none;" name="profile_cmt" id="profile_cmt"
					rows="5" maxlength="100">${mydata.profile_cmt }</textarea>
				<label style="text-align: center;">INTRO</label>
			</div>
		</div>
		<div class="12u 12u$(xsmall)">
			<ul class="actions">
				<li>
					<input type="submit" value="수정확인" class="special button" />
				</li>
			</ul>
		</div>
</form>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<script>
	
$(".update_form").submit(function(){
	var pwd=$("#pwd").val();
	var pwd2=$("#pwd2").val();
	var name=$("#name").val();
	var phone=$("#phone").val();
	var email=$("#email").val();
	var gender=$("#gender").val(); // M or F
	if(pwd != pwd2){
		alert("수정하는 비밀번호가 다릅니다.");
		return false;
	}
	if(pwd == ''){
		alert("비밀번호를 입력해주세요");
		return false;
	}
	if(name == ''){
		alert("이름을 입력해주세요");
		return false;
	}
	if(phone == ''){
		alert("휴대폰번호를 입력해주세요");
		return false;
	}
	if(email == ''){
		alert("이메일을 입력해주세요");
		return false;
	}
	if(gender == ''){
		alert("성별을 선택해주세요");
		return false;
	}
});
			
	/* 이미지 선택시 숨어있는 uploadcare 버튼이 팝업되게 연결 */
	$("#profileImage").click(function(e){
		$(".uploadcare--widget__button_type_open").click();
	});


	function installWidgetPreviewSingle(widget, img) {
		  widget.onChange(function(file) {
		    if (file) {
		      file.done(function(fileInfo) {
		        var size = '' + (img.width() * 2) + 'x' + (img.height() * 2);
		        var previewUrl = fileInfo.cdnUrl + '-/scale_crop/' + size + '/center/';
		        img.attr('src', previewUrl);
		        img.css('visibility', 'visible');
		        console.log("preview: "+previewUrl);
		        // 업로드한 image url을 얻어내서 photo_value 요소에 넣음
		        document.getElementById("photo_value").value=previewUrl;
		        console.log("VALUE: " +document.getElementById("photo_value").value);
		      });
		    }
		  });
		}
		
	$(function() {
	  $('.image-preview-single').each(function() {
	    installWidgetPreviewSingle(
	      uploadcare.SingleWidget($(this).children('input')),
	      $(this).children('img')
	    );
	  });
	});
</script>
</body>
</html>