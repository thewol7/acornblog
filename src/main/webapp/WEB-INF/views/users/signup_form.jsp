<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
.help-block{
		display: none;
	}
</style>
</head>
<body>
	<div class="container">
		<h3>회원가입 폼입니다.</h3>
		<form action="signup.do" method="post" id="signup_form" class="signup_form" novalidate>
			<div class="">
				<input type="text" name="id" id="id" placeholder="ID">
				<p class="help-block">사용할 수 없는 아이디 입니다.</p>
			</div>
			<div class="">
				<input type="password" name="pwd" id="pwd" placeholder="PASSWORD">
			</div>
			<div class="">
				<input type="text" name="name" id="name" placeholder="NAME">
			</div>
			<div class="">
				<input type="text" name="phone" id="phone" placeholder="PHONE">
			</div>
			<div class="">
				<input type="email" name="email" id="email" placeholder="EMAIL">
			</div>
			<div class="6u 12u$(xsmall) input-reform-bottom">
				<input type="radio" checked="checked" name="gender" id="man" value="M">
				<label for="man">MAN</label>
			</div>
			<div class="6u 12u$(xsmall) input-reform-bottom">
				<input type="radio" name="gender" id="female" value="F">
				<label for="female">FEMALE</label>
			</div>
			<div class="4u input-reform-bottom">
				<div class="image-preview-single">
					<image id="profileImage"
						src="${pageContext.request.contextPath }/resources/images/default.png" />
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
						placeholder="Enter your profile image and self introduction"
						rows="5" maxlength="100"></textarea>
					<label style="text-align: center;">INTRO</label>
				</div>
			</div>
			<div class="12u 12u$(xsmall)">
				<ul class="actions">
					<li>
						<input type="submit" value="회원가입" class="special button" />
					</li>
				</ul>
			</div>
		</form>
	</div>
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
	<script>
	//아이디 입력란에 keyup 이벤트가 발생했을때 실행할 함수 등록 
	$("#id").on("keyup", function(){
		//입력한 아이디 읽어오기
		var inputId=$("#id").val();
		//ajax 요청을 이용해서 서버에 전송
		$.ajax({
			url:"idCheck.do",
			method:"get",
			data:{inputId:inputId},
			
			success:function(data){
				console.log(data);
				if(data.canUse){
					$("#id")
					.parent()					
					.find(".help-block")
					.hide()					
				}else{
					$("#id")
					.parent()					
					.find(".help-block")
					.show()					
				}
			}
		});
	});
		
	$(".signup_form").submit(function(){
		var id=$("#id").val();
		var pwd=$("#pwd").val();
		var name=$("#name").val();
		var phone=$("#phone").val();
		var email=$("#email").val();
		var gender=$("#gender").val(); // M or F
		if(id == ''){
			alert("아이디를 입력해주세요");
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







