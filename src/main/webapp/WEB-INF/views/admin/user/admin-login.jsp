<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
	
	
	<title>Admin 페이지 로그인</title>
	
	<!-- Fontfaces CSS-->
	<link href="<%= request.getContextPath() %>/resources/admin_bootstrap/css/font-face.css"
		rel="stylesheet" media="all">
	<link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/font-awesome-4.7/css/font-awesome.min.css"
		rel="stylesheet" media="all">
	<link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/font-awesome-5/css/fontawesome-all.min.css"
		rel="stylesheet" media="all">
	<link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/mdi-font/css/material-design-iconic-font.min.css"
		rel="stylesheet" media="all">
	
	<!-- Bootstrap CSS-->
	<link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/bootstrap-4.1/bootstrap.min.css"
		rel="stylesheet" media="all">
	
	<!-- Vendor CSS-->
	<link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/animsition/animsition.min.css"
		rel="stylesheet" media="all">
	<link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"
		rel="stylesheet" media="all">
	<link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/wow/animate.css"
		rel="stylesheet" media="all">
	<link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/css-hamburgers/hamburgers.min.css"
		rel="stylesheet" media="all">
	<link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/slick/slick.css"
		rel="stylesheet" media="all">
	<link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/select2/select2.min.css"
		rel="stylesheet" media="all">
	<link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/perfect-scrollbar/perfect-scrollbar.css"
		rel="stylesheet" media="all">
	
	<!-- Main CSS-->
	<link href="<%= request.getContextPath() %>/resources/admin_bootstrap/css/theme.css"
		rel="stylesheet" media="all">
	
	<script>function putId(){ document.getElementById('id').value="Admin";}</script>
	<script>function putPass(){ document.getElementById('pass').value="Admin";}</script>
	
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
// 	$(document).ready(function() {
// 	document.getElementById("id").addEventListener("keyup", function(event){
// 		if(event.keyCode===13){
// 			$("#submit").click();
// 		}});
// 		document.getElementById("pass").addEventListener("keyup", function(event){
// 			if(event.keyCode===13){
// 				$("#submit").click();
// 			}
// 	});
// 	});
	</script>
	<script type="text/javascript">
// 	$(function() {
// 	$("#submit").click(function() { //submit form 밖에 빼기
// 		var formData = new FormData($('#loginForm')[0]);
// 		$.ajax({
// 			type: 'post',
// 			url: 'admin-login/ajax',
// 			dataType: 'json',
// 			contentType: "application/json; charset=utf-8;",
// 			data: JSON.stringify({
// 				"id":formData.get("id"),
// 				"pass":formData.get("pass")
// 			}), 
// 			success: function(data) {
// 				console.log("POST 수행 후 Response 수신 성공!");
// 				console.log(data.result);

// 				if(data.result == '/rudisfarm/admin/admin-index') {
// 					for(var key of formData.keys()){
// 						console.log(key);
// 					}
// 					for(var value of formData.values()){
// 						console.log(value);
// 					}
// 					console.log(formData);
// 					console.log($('#loginForm'));
// 					console.log($('#loginForm')[0]);
// 					console.log($('#loginForm')[0][1]);
// 					//alert(data.result);
// 					//alert("로그인 성공");
// 					location.href=data.result;
// 				} else if(data.result == 'admin-login') {
// 					alert('로그인 실패.');
// 				}		
// 			},
// 			error: function(e) {
// 				console.log("에러 발생!");
// 				console.log(e);
// 			}
// 		});
// 	});
// 	});
	</script>

</head>





<body class="animsition">
	<div class="page-wrapper">
		<div class="page-content--bge5">
			<div class="container">
				<div class="login-wrap" style="max-width: 650px;">
					<div class="login-content">
						<div class="login-logo">
							<a href="javascript:location.reload()"> <img
								src="<%= request.getContextPath() %>/resources/images/캡처1.PNG"
								alt="Login" style="width: 300px">
							</a>
						</div>
						<div class="login-form">
							<form:form id="loginForm" action="admin-login-process" method="post">
								<!---->
								<div class="form-group">
									<label>아 이 디</label> <input id="id"

										class="au-input au-input--full" type="text" name="USER_ID"
										placeholder="ID" required maxlength="30" autofocus="autofocus">
								</div>
								<div class="form-group">
									<label>비밀번호</label> <input id="pass"
										class="au-input au-input--full" type="password" name="PASSWORD"
										placeholder="Password" required maxlength="60">
								</div>
								<button class="au-btn au-btn--block au-btn--green m-b-20" id="submit" type="submit">로그인</button>
							</form:form>
							<div class="register-link">
								<p>
									<label> <a href="/rudisfarm/admin/admin-find">비밀번호 찾기</a></label>
								</p>
							</div>
							<!-- <div class="register-link">
                                    <button type="button" class="btn btn-secondary mb-1" id="modalButton" data-toggle="modal" data-target="#mediumModal" >아이디 생성하기</button>
                            </div> -->
						</div>
					</div>
				</div>
			</div>
		</div>



		<!-- <div class="modal fade" id="mediumModal" tabindex="-1" role="dialog" aria-labelledby="mediumModalLabel" style="display: none;" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="mediumModalLabel">
							
<c:choose>
<c:when test="${isExist == true}">이미 관리자 ID가 있습니다.</c:when>
<c:when test="${isExist == false}">생성 완료.</c:when>
</c:choose>
							</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							ID는 ${USERID} 입니다.
						</div>
					</div>
				</div>
			</div> -->


	</div>

	<!-- Jquery JS-->
	<script	src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap JS-->
	<script	src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/bootstrap-4.1/popper.min.js"></script>
	<script	src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/bootstrap-4.1/bootstrap.min.js"></script>
	<!-- Vendor JS       -->
	<script	src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/slick/slick.min.js"></script>
	<script	src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/wow/wow.min.js"></script>
	<script	src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/animsition/animsition.min.js"></script>
	<script	src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<script	src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/counter-up/jquery.waypoints.min.js"></script>
	<script	src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/counter-up/jquery.counterup.min.js"></script>
	<script	src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/circle-progress/circle-progress.min.js"></script>
	<script	src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
	<script	src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/chartjs/Chart.bundle.min.js"></script>
	<script	src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/select2/select2.min.js"></script>

	<!-- Main JS-->
	<script	src="<%= request.getContextPath() %>/resources/admin_bootstrap/js/main.js"></script>

</body>

</html>