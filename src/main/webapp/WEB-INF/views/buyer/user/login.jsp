<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"/>
		<jsp:include page="/resources/bootstrap/commons/head.jsp"/>
		<link rel="shortcut icon" href="images/favicon.ico"/>
		<title>RudisFarm &#8211; login</title>

		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" type="text/css" media="all"/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/font-awesome.min.css" type="text/css" media="all" />
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/ionicons.min.css" type="text/css" media="all" />
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/owl.carousel.css" type="text/css" media="all"/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/owl.theme.css" type="text/css" media="all"/>
		<link rel='stylesheet' href="<%= request.getContextPath() %>/resources/bootstrap/css/prettyPhoto.css" type='text/css' media='all'/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/style.css" type="text/css" media="all"/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/custom.css" type="text/css" media="all"/>
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="//fonts.googleapis.com/css?family=Great+Vibes%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet"/>
		<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
		<style type="text/css">
/* 		    #customBtn { */
/* 		      display: inline-block; */
/* 		      background: white; */
/* 		      color: #444; */
/* 		      width: 250px; */
/* 		      border-radius: 5px; */
/* 		      border: thin solid #999; */
/* /* 		      box-shadow: 1px 1px 1px grey; */ */
/* 		      white-space: nowrap; */
/* 		    } */
/* 		    #customBtn:hover { */
/* 		      cursor: pointer; */
/* 		    } */
/* 		    span.label { */
/* 		      font-family: serif; */
/* 		      font-weight: normal; */
/* 		    } */
/* 		    span.icon { */
/* 		      background: url('/rudisfarm/resources/images/login/g-logo.png') transparent 5px 50% no-repeat; */
/* 		      display: inline-block; */
/* 		      vertical-align: middle; */
/* 		      width: 54px; */
/* 		      height: 54px; */
/* 		    } */
/* 		    span.buttonText { */
/* 		      display: inline-block; */
/* 		      vertical-align: middle; */
/* 		      padding-left: 5px; */
/* 		      padding-right: 10px; */
/* 		      font-size: 17px; */
/* 		      font-weight: bold; */
/* 		      /* Use the Roboto font that is loaded in the <head> */ */
/* 		      font-family: 'Nanum Gothic', 'Roboto', sans-serif; */
		    }
		</style>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(e){
		var idx = false;
        	
		/* 가입 버튼 누를시 유효성 검사 */
		$('#signUp').click(function(){
			var pushData = JSON.stringify({
				emailkCheckVal: $('#EMAIL').val()
			});

			if($.trim($('#USER_ID').val()) == ''){
				alert("아이디 입력.");
				$('#USER_ID').focus();
				return;
			}else if($.trim($('#PASSWORD').val()) == ''){
				alert("패스워드를 입력해주세요.");
				$('#PASSWORD').focus();
				return;
			}
			//패스워드 확인
			else if($('#PASSWORD').val() != $('#PASSWORD_CHECK').val()){
				alert('패스워드가 다릅니다.');
				$('#PASSWORD_CHECK').focus();
				return;

			} else if($.trim($('#EMAIL').val()) == ''){
				alert("이메일을 입력해주세요.");
				$('#EMAIL').focus();
				return;
				
			}else if($.trim($('#FIR_ADDRESS').val()) == ''){
				console.log($('#FIR_ADDRESS').val())
				alert("주소를 입력해주세요.");
				$('#FIR_ADDRESS').focus();
				return;
			
			}else if($.trim($('#SEC_ADDRESS').val()) == ''){
				alert("상세 주소를 입력해주세요.");
				$('#SEC_ADDRESS').focus();
				return;
				
			}else if($.trim($('#PHONE').val()) == ''){
				alert("전화번호를 입력해주세요.");
				$('#PHONE').focus();
				return;
				
			}else if($.trim($('#BIRTHDATE').val()) == ''){
				alert("생일을 입력해주세요.");
				$('#BIRTHDATE').focus();
				return;
			}
			
			if(idx==false){
				alert("아이디 중복체크를 해주세요.");
				return;
			}else{
				alert("루디스팜 회원 가입을 축하드립니다!");
				$('#joinForm').submit();
				
			}
		});
		
		/* 아이디 중복 체크 */
		$('.idCheck').click(function(){
			$.ajax({
				url: "${pageContext.request.contextPath}/idCheck",
				type: "GET",
				data:{
					"idcheckval":$('#USER_ID').val()
				},
				success: function(data){
					if(data == 0 && $.trim($('#USER_ID').val()) != '' ){
						idx=true;
						$('#USER_ID').attr("readonly",true);
						var html="<tr><td colspan='3' style='color: green'>사용 가능</td></tr>";
						$('.idCheck').empty();
						$('.idCheck').append(html);
						$("#id_label").hide();

					}else{
						alert("사용할 수 없는 아이디입니다.");
						$("#USER_ID").val('');
					/* 	$("#USER_ID").empty(); */
						$('.idCheck').empty();
						var html="<tr><td colspan='3'>&nbsp; 중복체크</td></tr>";
						$('.idCheck').append(html);
					}
				},
				error: function(){
					alert("서버에러");
				}
			});
		});
	});
</script>

<script>
/* 이메일 중복 검사 */
$(document).ready(function(){
	$('#EMAIL').blur(function(){
		console.log('이메일 키업1');
		
		$.ajax({
				url: "${pageContext.request.contextPath}/emailCheck",
				type: "GET",
				data:{
					"emailkCheckVal":$('#EMAIL').val()
				},
				
				success: function(data){					
					if(data != 0 || $.trim($('#EMAIL').val()) == '' ){
						console.log('이메일 중복되거나 비어있을 경우' + data);
						/* $("#EMAIL").css("background-color", "#FFCECE"); */
						$(".mail_check_button").attr("disabled", "ture");
						$("#mail_check_input").attr("disabled", "ture");
						$("button#signUp").attr("disabled", "ture");
						$("#mail_description").attr("type", "text");
						$("#mail_description").attr("value", "이미 가입된 이메일 주소입니다.");
						$("#mail_description").attr("style", "color:red");

					}else if(data == 0 && $.trim($('#EMAIL').val()) != '' ) {
						console.log('이메일 중복이 없을 경우' + data);
						/* $("#EMAIL").css("background-color", "#B0F6AC"); */
						$(".mail_check_button").removeAttr("disabled");
						$("#mail_check_input").removeAttr("disabled");
						$("button#signUp").removeAttr("disabled");
						$("#mail_description").attr("type", "hidden");
					}
				},
				error:function(request,status,error){
			        alert("먼저 올바른 이메일을 입력하고 인증번호를 발급받아 주십시오"); // 실패 시 처리
				}
		});
	});
});
</script>

<script>
/* 인증번호 일치 검사 */
$(document).ready(function(){
	$('#mail_check_input').blur(function(){
		console.log('키업1');
		var emailkCheckVal = $('#EMAIL').val();

		$.ajax({
			type : 'PUT',         
			url: '${pageContext.request.contextPath}/keyCheck', 
			dataType: 'json',
			contentType: 'application/json; charset=utf-8;',
			data : JSON.stringify({
				EMAIL : emailkCheckVal
			}),

			success: function(data){
				
				var result = data["result"];
				console.log('result : ' + result);
				
				if(result != $('#mail_check_input').val()){
					console.log('인증 번호 다름');
					$("#mail_check_input").css("background-color", "#FFCECE");
					$("button#signUp").attr("disabled", "ture");
					
				}else if(result == $('#mail_check_input').val()) {
					console.log('인증 번호 같음');
					$("#mail_check_input").css("background-color", "#B0F6AC");
					$("button#signUp").removeAttr("disabled");

				}
			},
			error:function(request,status,error){
		        alert("먼저 올바른 이메일을 입력하고 인증번호를 발급받아 주십시오"); // 실패 시 처리
		       },
		});
	});
});
</script>
<script>
/* 메일 보내기 */
$(document).ready(function(e){
	$('.mail_check_button').click(function(){
	    
	    var email = $('#EMAIL').val(); // 이메일 가져오기
	    console.log('메일 펑션');
	    
	         $.ajax({
	        url:"mailCheck?email=" + email,
	        type:"GET",
	    }); 
	});
});
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
/* 주소 찾기 */
//https://postcode.map.daum.net/guide#sample 참조
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("FIR_ADDRESS").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("SEC_ADDRESS").focus();
            }
        }).open();
    }
</script>

	</head>
	<body>
		<jsp:include page="/resources/bootstrap/commons/menu_slideout.jsp" />
		<div class="site">
			<jsp:include page="/resources/bootstrap/commons/topbar.jsp" />
			<jsp:include page="/resources/bootstrap/commons/header.jsp" />
			<div id="main">
				<div class="section section-bg-10 pt-11 pb-17">
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<h2 class="page-title text-center">로그인</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="section border-bottom pt-2 pb-2">
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<ul class="breadcrumbs">
									<li><a href="./">메인</a></li>
									<li><a href="login">로그인</a></li>
									<!-- <li>My Account</li> -->
								</ul>
							</div>
						</div>
					</div>
				</div>
				
				
				<!-- 로그인 시작 -->
				<div class="section pt-7 pb-7">
					<div class="container">
						<div class="row">
							<div class="col-md-3 col-lg-3 col-sm-2"></div>
								<div class="col-md-6 col-sm-9">
								<div class="commerce">
									<h2 style="text-align:center;">로그인</h2>
									<form:form name="f" action="login-process" method="POST">
										<div class="row">
											<div class="col-md-12">
												<label>아이디 <span class="required">*</span></label>
												<div class="form-wrap">
													<input type="text" placeholder="ID" id="USER_ID" name="USER_ID" value="" size="40" autofocus="autofocus">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<label>비밀번호 <span class="required">*</span></label>
												<div class="form-wrap">
													<input type="password" placeholder="PASSWORD" id="PASSWORD" name="PASSWORD" value="" size="40">
												</div>
												<c:if test="${requestScope.loginFail}">
												<div class="form-wrap">
													${requestScope.loginFailMsg}
												</div>
												</c:if>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-wrap">
													<input type="submit" value="LOGIN">
												</div>
											</div>
										</div>
										
										<hr class="one">
										<!-- 소셜 로그인 버튼들 -->
										<h2 style="text-align:center;">소셜 로그인</h2>
										<div class="row text-center">
											<table class="row text-center" style="margin:0 auto; width: 380px;">
												<tbody>
													<tr>
														<td class="text-center">
														<a id="custom-login-btn" href="javascript:loginWithKakao()">
																<img src="/rudisfarm/resources/images/login/kakaoLogin.png">	
<!-- 															<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="350" /> -->
														</a>
														</td>
													</tr>
													<tr>
														<td class="text-center">
															<div id="naverIdLogin" style="position:absolute; top: -10000px;"></div>
															<a id="custom-login-btn" href="javascript:handleNaverLogin();">
																<img src="/rudisfarm/resources/images/login/naverLogin.png">
															</a>
														</td>
													</tr>
													<tr>
														<td class="text-center">
<!-- 															<div class="g-signin2" data-onsuccess="onSignIn" data-width="350" data-height="75" data-longtitle="true"></div> -->
<!-- 															<div id="gSignInWrapper"> -->
																<a id="customBtn" class="customGPlusSignIn" style="cursor: pointer;">
																	<img src="/rudisfarm/resources/images/login/googleLogin.png">
<!-- 																	<span class="icon"></span> -->
<!-- 																	<span class="buttonText">구글 아이디로 로그인</span> -->
																</a>
<!-- 															</div> -->
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<hr class="one">
										<div class="row">
											<div class="col-md-12" style="text-align:right;">
												<p>처음 오셨나요? |
													<a href="join"><span> 회원가입 </span></a>
												<p>계정을 잊어버리셨다면 |
													<a href="find"><span> 아이디/비밀번호 찾기 </span></a>
											</div>
										</div>
									</form:form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 로그인 끝 -->

				<br>
					<button id="encode" onclick="encode();">비번 인코딩</button>
					<script type="text/javascript">
					function encode() {
						$.ajax({
							type: 'POST',
							url: '/rudisfarm/userEncode', 
							dataType: 'json',
							success: function(data) {
								console.log("인코딩 성공 : " + data);
							},
							error: function(e) {
								console.log("에러 발생!");
								console.log(e);
							}
						});
					}
					
					</script>
<!-- 					<button type="button" id="kakaoUnlink" onclick="unlinkWithKakao();">카카오 연동 해제</button> -->
			</div>
			
			<!-- 메인 -->
			
			<jsp:include page="/resources/bootstrap/commons/footer.jsp"/>
		</div>

		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/add-cart.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/categori-header.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/cart-list.js"></script>

		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery-migrate.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/modernizr-2.7.1.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/owl.carousel.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery.countdown.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery.prettyPhoto.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery.prettyPhoto.init.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/script.js"></script>
		<!-- 네이버 소셜 로그인 -->
<%-- 		<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/naver/naverLogin.js?v=<%=System.currentTimeMillis()%>"></script> --%>
	</body>
</html>