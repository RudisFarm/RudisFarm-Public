<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="au theme template">
	<meta name="author" content="Hau Nguyen">
	<meta name="keywords" content="au theme template">
	
	<title>Admin 비밀번호 찾기</title>
	
	<!-- Fontfaces CSS-->
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/css/font-face.css"
		rel="stylesheet" media="all">
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/font-awesome-4.7/css/font-awesome.min.css"
		rel="stylesheet" media="all">
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/font-awesome-5/css/fontawesome-all.min.css"
		rel="stylesheet" media="all">
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/mdi-font/css/material-design-iconic-font.min.css"
		rel="stylesheet" media="all">
	
	<!-- Bootstrap CSS-->
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-4.1/bootstrap.min.css"
	rel="stylesheet" media="all">
	
	<!-- Vendor CSS-->
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/animsition/animsition.min.css"
		rel="stylesheet" media="all">
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"
		rel="stylesheet" media="all">
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/wow/animate.css"
		rel="stylesheet" media="all">
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/css-hamburgers/hamburgers.min.css"
		rel="stylesheet" media="all">
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/slick/slick.css"
		rel="stylesheet" media="all">
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/select2/select2.min.css"
		rel="stylesheet" media="all">
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/perfect-scrollbar/perfect-scrollbar.css"
		rel="stylesheet" media="all">
	
	<!-- Main CSS-->
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/css/theme.css"
		rel="stylesheet" media="all">
	
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		
		
		var adminEmailVal = false;
		var adminPassVal = false;
		
	/* 관리자 이메일인지 확인 */
	$('#adminCheckButton').click(function(){
		console.log('이메일 유무 확인');
		
		$.ajax({
				url: "${pageContext.request.contextPath}/admin-emailcheck",
				type: "GET",
				data:{
					"EMAIL":$('#EMAIL').val()
				},
				success: function(data){		
					console.log('////// adminCheckButton_data : ' + data);
					if($.trim($('#EMAIL').val()) == ''){
						alert('이메일이 비어 있습니다.')
						adminEmailVal = false;
						return;
					} else if(data == 0){
						console.log('관리자 이메일이 아닐 경우' + data);
						alert('관리자 이메일이 아닙니다.')
						adminEmailVal = false;
						return;
					} else if(data == 1) {
						console.log('관리자 이메일이 맞을 경우' + data);
						adminEmailVal = true;
						sendEmail(); //메일 보내기
					}
				},
				error:function(request,status,error){
			        alert("알 수 없는 문제가 발생하였습니다."); // 실패 시 처리
			        adminEmailVal = false;
				}
		});
	});
		
		/* 비밀번호 찾기 인증코드 일치 검사 */
		$('#mailCheckButton').click(function(){
			console.log('비밀번호 찾기 이메일 인증코드 일치 검사');
		
			$.ajax({
				type : 'POST',         
				url: '${pageContext.request.contextPath}/buyer-findpw/emailcheckresult', 
				dataType: 'json',
				contentType: 'application/json; charset=utf-8;',
				data : JSON.stringify({
					EMAIL: $('#EMAIL').val(),
					CHECK_KEY: $('#mailCheckInput').val()
				}),
		
				success: function(data){
					
					if($.trim($('#mailCheckInput').val()) == ''){
						console.log('인증번호가 비었음' + data);
						alert('인증 번호가 비어 있습니다.');
						adminPassVal = false;
		
					}else if(data.resultCode == 0){
						console.log('인증 번호 다르거나 시간을 초과');
						alert('인증 번호가 다릅니다.');
						adminPassVal = false;
					
					}else if(data.resultCode == 1) {
						console.log('인증 번호 같음');
						alert('인증 되었습니다.');
						$("#timer").attr("style", "display:none");
						adminPassVal = true;
					}
				},
				error:function(e){
			        alert("알 수 없는 문제가 발생하였습니다."); // 실패 시 처리
			        console.log("에러 발생!");
					console.log(e);
					adminPassVal = false;
			       },
				});
		});
		
		
		/* 임시 비밀번호 이메일 보내기 */
		$('#adminFindSubmit').click(function(){
			console.log('임시비밀번호 보내기 submit 키업1');
			console.log('adminEmailVal : ' + adminEmailVal);
			console.log('adminPassVal : ' + adminPassVal);
			if(adminEmailVal == false){
				alert('이메일을 먼저 확인해주세요.');
				return;
			}else if(adminPassVal == false){
				alert('인증코드를 먼저 확인해주세요.');
				return;
			} else {
				console.log('이메일 인증 완료');
				$.ajax({
						url: "${pageContext.request.contextPath}/buyer-findpw/emailcheckupdate",
						type: "POST",
						dataType : 'json',
						contentType: 'application/json; charset=utf-8;',
						data : JSON.stringify({
							"EMAIL":$('#EMAIL').val()
						}),
						
						success: function(data){
							if(data.resultCode == 99){
								alert("관리자 계정이 아닙니다.");
							} else if(data.resultCode == 1){
								console.log('메일 감');
								alert("회원님께서 입력하신 주소로 임시 비밀번호가 전송되었습니다.");
								location.href="/rudisfarm/admin/admin-login";
							} else {
								alert("메일 전송에 실패했습니다. 잠시 후 다시 시도해주십시오.");
							}
						},
						error:function(e){
					        alert("알 수 없는 문제가 발생하였습니다. 관리자에게 문의해주십시오."); // 실패 시 처리
					        console.log("에러 발생!");
							console.log(e);
						}
				}); //에이젝스
			} //else
		}); //이메일 보내기
		
	});	//ready
	
	
	//타이머
	 function certifyTimer(){
		var time = 59;
		var sec ="";
		
		var x =setInterval(function() {
			sec = time%60;
			$("#timer").css("color", "red");
			document.getElementById("timer").innerHTML = "남은시간:"+ sec + "초";
			time--;
			//타임아웃시
			if(time<0) {
				clearInterval(x);
				document.getElementById("timer").innerHTML = "시간 초과";
				}
			}, 1000);
	} //타이머
	
	
	//비밀번호 찾기 인증코드 이메일 보내기
	function sendEmail(){
		console.log('인증번호 발급');
			$.ajax({
					url: "${pageContext.request.contextPath}/buyer-findpw/emailcheck",
					type: "POST",
					dataType: 'json',
					contentType: "application/json; charset=utf-8;",
					data: JSON.stringify({
						"EMAIL":$('#EMAIL').val()
						}),
					
					success: function(data){
						if(data.resultCode == 1) {
							alert("입력하신 주소로 인증코드가 전송되었습니다");
							certifyTimer();
							$("#timer").css("style", "display:block");
						} else {
							alert("인증코드 전송에 실패했습니다. 잠시 후 다시 시도해주세요.");
						}
					},
					error: function(e) {
						console.log("에러 발생!");
						console.log(e);
					}
			});
			
		} //메일 보내기
	
	
	
	
	</script>
	
</head>

<body class="animsition">
	<div class="page-wrapper">
		<div class="page-content--bge5">
			<div class="container">
				<div class="login-wrap" style="max-width: 650px;">
					<div class="login-content"> <!-- 흰색 배경 -->
						<div class="login-logo">
							<a href="/rudisfarm/admin/admin-login"> <img src="<%=request.getContextPath()%>/resources/images/캡처1.PNG" alt="Login" style="width: 300px"></a>
						</div>
<%-- 
							<form id="emailForm" method="post" onsubmit="return false">
								<div class="form-group">
									<label>이메일</label> <input id=email
										class="au-input au-input--full" type="email" name="email"
										placeholder="E-Mail" required maxlength="50">
								</div>
							</form>
								<button class="au-btn au-btn--block au-btn--blue m-b-20" type="submit" id="submit">메일로 ID, 비밀번호 전송</button>
--%>					<div class="form-group">		
							<div class="row">
								<div class="col-md-11 col-lg-11">
									<label>이메일 <span class="required" style="color:red;">*</span></label>
								</div>
							</div>
							
							
							<div class="row" style="padding-bottom:10px;">
								<div class="col-md-8 col-sm-8 col-xs-8 col-lg-8">
									<input type="email" class="au-input au-input--full" placeholder="이메일을 입력해주세요." id="EMAIL" name="EMAIL" value="" size="30" required>
								</div>&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="col-md-3 col-sm-3 col-xs-3 col-lg-3">
									<button id="adminCheckButton" class="btn au-btn--blue btn-block" type="button" style="white-space:nowrap;color:white;">인증번호 발급</button>
								</div>
							</div>
	
							<div class="row">
								<div class="col-md-8 col-sm-8 col-xs-8 col-lg-8">
									<label>이메일 인증번호 <span class="required" style="color:red;">*</span></label>
								</div>
								<div id="timer" class="col-md-3 col-sm-3 col-xs-3 col-lg-3"></div>
							</div>
							
							<div class="row">
								<div class="col-md-8 col-sm-8 col-xs-8 col-lg-8" >
									<input type="text" class="au-input au-input--full" placeholder="인증번호를 입력해주세요." id="mailCheckInput" value="" size="40" style="padding-right:10px !important;" required>
								</div>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="col-md-3 col-sm-3 col-xs-3 col-lg-3">
									<button id="mailCheckButton" class="btn au-btn--blue btn-block" type="button" style="white-space:nowrap;color:white;">인증번호 확인</button>
								</div>
							</div>
								
						</div> <!-- /form-group -->
						
						<!-- class="au-btn au-btn--block au-btn--blue m-b-20" -->
						<div class="row">
							<div class="col-md-8 col-sm-8 col-xs-8 col-lg-8" >
								<input id="adminFindSubmit" class="btn au-btn--blue btn-block" style="color:white;" type="button" value="비밀번호 찾기 이메일 보내기">
							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="col-md-3 col-sm-3 col-xs-3 col-lg-3" >
								<label style="color:white;" class="btn au-btn--blue btn-block" onclick="javascipt:location.href='/rudisfarm/admin/admin-login';" >돌아가기</label>
							</div>
						</div> <!-- submit -->
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Jquery JS-->
	<script src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/jquery-3.2.1.min.js"></script>

	<!-- Bootstrap JS-->
	<script src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-4.1/popper.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-4.1/bootstrap.min.js"></script>

	<!-- Vendor JS       -->
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/slick/slick.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/wow/wow.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/animsition/animsition.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/counter-up/jquery.waypoints.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/counter-up/jquery.counterup.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/circle-progress/circle-progress.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/chartjs/Chart.bundle.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/select2/select2.min.js"></script>

	<!-- Main JS-->
	<script src="<%=request.getContextPath()%>/resources/admin_bootstrap/js/main.js"></script>
</body>

</html>