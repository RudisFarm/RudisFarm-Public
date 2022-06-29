<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"/>
		<jsp:include page="/resources/bootstrap/commons/head.jsp"/>
		<link rel="shortcut icon" href="images/favicon.ico"/>
		<title>RudisFarm &#8211; My-info</title>

		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" type="text/css" media="all"/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/font-awesome.min.css" type="text/css" media="all" />
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/ionicons.min.css" type="text/css" media="all" />
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/owl.carousel.css" type="text/css" media="all"/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/owl.theme.css" type="text/css" media="all"/>
		<link rel='stylesheet' href="<%= request.getContextPath() %>/resources/bootstrap/css/prettyPhoto.css" type='text/css' media='all'/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/style.css" type="text/css" media="all"/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/custom.css" type="text/css" media="all"/>
		<link href="//fonts.googleapis.com/css?family=Great+Vibes%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet"/>
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
/* 유효성 검사 및 값 처리 */
 $(document).ready(function(e){

	 var RegExp = /^[a-zA-Z0-9]{4,12}$/; //pwassword 유효성 정규식
     var n_RegExp = /^[가-힣a-zA-Z]{2,15}$/; //이름 유효성  정규식
     var p_RegExp = /^[0-9]{11,13}$/; //핸드폰 유효성 정규식
     
     var originPwd = false;
     
     var userPlatform = "<c:out value='${userDetail.PLATFORM}'/>"; 
     console.log(userPlatform);
     
     var objPwd = document.getElementById("PASSWORD"); //비밀번호
     var objPwd2 = document.getElementById("PASSWORD_CHECK"); //비밀번호확인
     var objName = document.getElementById("USER_NAME"); //이름
     var objPhone = document.getElementById("PHONE"); //핸드폰
     
		$('#modify_button').click(function(){
			console.log("modify_button 누름")
			
				
			if(userPlatform == 'rudisfarm' && $.trim($('#passCheck').val()) == ''){
				alert("현재 비밀번호를 입력해주세요.");
				$('#passCheck').focus();
				return;
				
			}else if(userPlatform == 'rudisfarm' && originPwd == false){
				alert("기존 비밀번호가 맞지 않습니다.");
				$('#PASSWORD').focus();
				return;
				
			}else if(userPlatform == 'rudisfarm' && $.trim($('#PASSWORD').val()) == ''){
				alert("비밀번호를 입력해주세요.");
				$('#PASSWORD').focus();
				return;
				
			} else if(userPlatform == 'rudisfarm' && !RegExp.test(objPwd.value)){ //패스워드 유효성검사
	            alert("비밀번호는 4~12자의 영문 대소문자와 숫자만 가능합니다.");
	            $('#PASSWORD').val() == '';
				$('#PASSWORD').focus();
	            return;
			
			 //패스워드 확인
			} else if(userPlatform == 'rudisfarm' && $('#PASSWORD').val() != $('#new_passCheck').val()){
				alert('비밀번호 확인 값이 다릅니다.');
				$('#PASSWORD_CHECK').focus();
				$('#PASSWORD').val() == '';
				$('#new_passCheck').val() == '';
				return;

			} else if($.trim($('#USER_NAME').val()) == ''){
				alert("이름을 입력해주세요.");
				$('#USER_NAME').focus();
				return;
				
			} else if(!n_RegExp.test(objName.value)){
	            alert("이름은 2~15글자의 한글 및 영어로만 가능합니다.");
	            $('#USER_NAME').val() == '';
				$('#USER_NAME').focus();
	            return;
				
			} else if($.trim($('#FIR_ADDRESS').val()) == ''){
				alert("주소를 입력해주세요.");
				$('#FIR_ADDRESS').focus();
				return;
			
			} else if($.trim($('#SEC_ADDRESS').val()) == ''){
				alert("상세 주소를 입력해주세요.");
				$('#SEC_ADDRESS').focus();
				return;
				
			} else if($.trim($('#PHONE').val()) == ''){
				alert("전화번호를 입력해주세요.");
				$('#PHONE').focus();
				return;
				
			} else if(!p_RegExp.test(objPhone.value)){
	            alert("정상적인 전화번호를 입력해주세요.");
				$('#PHONE').val() == '';
				$('#PHONE').focus();
	            return;
				
			} else {
				if(userPlatform == 'rudisfarm') {
					console.log('루디스팜 put');
					$.ajax({
						type: 'put',
						url: '/rudisfarm/my-page/my-info', 
						dataType: 'json',
						contentType: "application/json; charset=utf-8;",
						data: JSON.stringify({
									USER_ID: $("#USER_ID").val(),
									PASSWORD: $("#PASSWORD").val(),
									USER_NAME: $("#USER_NAME").val(),
									FIR_ADDRESS: $("#FIR_ADDRESS").val(),
									SEC_ADDRESS: $("#SEC_ADDRESS").val(),
									PHONE: $("#PHONE").val(),
									GENDER: $("input[name='GENDER']:checked").val()
								}), 
						success: function(data) {
							console.log("PUT 수행 후 Response 수신 성공!");
							console.log(data);
							
							if(data == true) {
								alert("개인 정보 수정이 완료되었습니다.")
								location.href="/rudisfarm";
							} else if(data == false) {
								alert("개인 정보 수정이 실패하였습니다.");
								location.href="/rudisfarm/my-page/my-info-modify-form";
							}
						},
						error: function(e) {
							console.log("에러 발생!");
							console.log(e);
						}
					});
				
				} else if (userPlatform != 'rudisfarm') {
					console.log('소셜 로그인 put');
					$.ajax({
						type: 'put',
						url: '/rudisfarm/my-page/my-info-social', 
						dataType: 'json',
						contentType: "application/json; charset=utf-8;",
						data: JSON.stringify({
									USER_ID: $("#USER_ID").val(),
									FIR_ADDRESS: $("#FIR_ADDRESS").val(),
									SEC_ADDRESS: $("#SEC_ADDRESS").val(),
									PHONE: $("#PHONE").val(),
									GENDER: $("input[name='GENDER']:checked").val()
								}), 
						success: function(data) {
							console.log("PUT 수행 후 Response 수신 성공!");
							console.log(data);
							
							if(data == true) {
								alert("개인 정보 수정이 완료되었습니다.")
								location.href="/rudisfarm";
							} else if(data == false) {
								alert("개인 정보 수정이 실패하였습니다.");
								location.href="/rudisfarm/my-page/my-info-modify-form";
							}
						},
						error: function(e) {
							console.log("에러 발생!");
							console.log(e);
						}
					});
				} //수정
			} //유효성 통과 후
		}); //수정 버튼 누를때
		
		//기존 비밀번호 확인
		$('#passCheck').blur(function(){
			console.log('비밀번호 확인 스크립트');
			var passCheckId = '${USER_ID}';
			var passCheckPwd = $("#passCheck").val();
			
			console.log('passCheckId :' +passCheckId);
			console.log('passCheck :' +passCheckPwd);
			
			if($.trim($('#passCheck').val()) == '') {
				$("#passCheck").css("background-color", "#ffeded");
				$('#newPasswordCheckMsgOld').html("비밀번호가 비어있습니다.");
				return;
			}

			$.ajax({
				type : 'PUT',         
				url: '${pageContext.request.contextPath}/my-page/passCheck', 
				dataType: 'json',
				contentType: 'application/json; charset=utf-8;',
				data : JSON.stringify({
					checkid : passCheckId,
					checkpwd : passCheckPwd,
				}),

				success: function(data){
					console.log('키업2 성공시');

					var result = data;
						
					if(result == false) {
						console.log('비밀번호가 다를때');
						/* alert("비밀 번호가 다릅니다."); */

						//비밀번호 input 붉게
						$("#passCheck").css("background-color", "#ffeded");
        				$('#newPasswordCheckMsgOld').html("비밀번호가 다릅니다.");

						/* //버튼 비활성화
						$("#modify_button").attr("disabled", "true"); */
        				originPwd = false;
						

					} else if(result == true) {
						console.log('저장된 비밀번호와 같을 경우');
						
						//비밀번호 문구 초록색
						$("#passCheck").css("background-color", "#eeffed");
        				$('#newPasswordCheckMsgOld').html("");

        				/* $('#newPasswordCheckMsgOld').html("비밀번호가 일치합니다."); */
        				originPwd = true;

					}
				},
				error:function(request,status,error){
					console.log('키업3 실패시');
			        alert("알 수 없는 문제가 발생했습니다. 관리자에게 문의해주십시오."); // 실패 시 처리
				}
		});
	});
		
		//새 비밀번호 유효성 체크
		$('.classPass').keyup(function(){
			console.log('새 비밀번호 체크');
			
			if (!RegExp.test(objPwd.value)){
				console.log('비밀번호 유효성 체크')
				$("#PASSWORD").css("background-color", "#ffeded");
				$("#new_passCheck").css("background-color", "#ffeded");
				$('#newPasswordCheckMsgNew').html("비밀번호는 4~12자의 영문 대소문자만 가능합니다.");
				
			}else if (!RegExp.test(objPwd.value) && $('#new_passCheck').val() == $.trim($('#PASSWORD').val())){
					console.log('비밀번호 유효성 체크')
					$("#PASSWORD").css("background-color", "#ffeded");
					$("#new_passCheck").css("background-color", "#ffeded");
					$('#newPasswordCheckMsgNew').html("비밀번호는 4~12자의 영문 대소문자만 가능합니다.");
			
			}else if($.trim($('#new_passCheck').val()) != $.trim($('#PASSWORD').val())){
				console.log('신규 비밀번호 동일하지 않음');
				$("#new_passCheck").css("background-color", "#ffeded");
				$("#PASSWORD").css("background-color", "#ffeded");
				$('#newPasswordCheckMsgNew').html("비밀번호 확인 값이 서로 다릅니다.");

			} else if($.trim($('#new_passCheck').val()) == $.trim($('#PASSWORD').val())){
				console.log('신규 비밀번호 같음');
				$("#new_passCheck").css("background-color", "#eeffed");
				$("#PASSWORD").css("background-color", "#eeffed");
				$('#newPasswordCheckMsgNew').html("");
			}
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
								<h2 class="page-title text-center">회원 정보</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="section border-bottom pt-2 pb-2">
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<ul class="breadcrumbs">
									<li><a href="/rudisfarm">메인</a></li>
									<li>회원 정보</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				
				
				<!-- 여기서부터 개인정보 접속 비밀번호 체크 -->
				
				<div class="section pt-7 pb-7">
					<div class="container">
						<div class="row">
								<div class="col-md-9 col-md-push-3">
									<h2 style="text-align:center;">회원 정보 수정</h2> 
									<hr class="one">
									<form id="buyerModifyForm" name="buyerModifyForm">
										<c:set var="userPlatformVar" value="${userDetail.PLATFORM}" />
                                       		<c:choose> 
                                       			<c:when test="${userPlatformVar eq 'rudisfarm'}">
													<div class="row">
														<div class="col-md-12">
															<label>아이디 </label>
															<input type="text" id="USER_ID" name="USER_ID" value="${userDetail.USER_ID}" size="35" style="background-color: #FAFAFA;" readonly>
														</div>
													</div>
												</c:when>
                                          		<c:otherwise>
													<input type="hidden" id="USER_ID" name="USER_ID" value="${userDetail.USER_ID}" size="35" style="background-color: #FAFAFA;" readonly>
                                          		</c:otherwise>
											</c:choose>
                                       		<c:choose> 
                                         			<c:when test="${userPlatformVar eq 'rudisfarm'}">
												<div class="row">
													<div class="col-md-12">
														<label>비밀번호 변경 <span class="required">*</span></label>
														<div class="form-wrap">
															<div class="col-12">
					                                            <p class="form-control-static">
																		<input type="password" placeholder="현재 비밀번호" id="passCheck" name="passCheck" value="" size="40" required>
																		<input type="password" placeholder="새 비밀번호" class="classPass" id="PASSWORD" name="PASSWORD" value="" size="40" required>
																		<input type="password" placeholder="비밀번호 확인" class="classPass" id="new_passCheck" name="new_passCheck" value="" size="40" required>
             						                                        	<small class="help-block form-text" id="newPasswordCheckMsgOld"></small>
							                                        	<small class="help-block form-text" id="newPasswordCheckMsgNew" style="color:red;"></small>
															</div>
														</div>
													</div> 
												</div>
											</c:when>
                                          		<c:otherwise></c:otherwise>
										</c:choose>
										
										<div class="row">
											<div class="col-md-12">
												<label>이메일 </label>
												<div class="form-wrap">
													<input type="email" id="EMAIL" name="EMAIL" value="${userDetail.EMAIL}" size="40" style="background-color: #FAFAFA;" readonly required>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<label>이름 <span class="required">*</span></label>
												<div class="form-wrap">
													<c:set var="ModifyPlatformVar" value="${userDetail.PLATFORM}" />
	                                           		<c:choose> 
	                                           			<c:when test="${ModifyPlatformVar eq 'rudisfarm'}">
															<input type="text" id="USER_NAME" name="USER_NAME" value="${userDetail.USER_NAME}" size="40" required>
														</c:when>
		                                           		<c:otherwise>
                                 									<input type="text" id="USER_NAME" name="USER_NAME" value="${userDetail.USER_NAME}" size="40" disabled required>
		                                           		</c:otherwise>
													</c:choose>														
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<label>주소 <span class="required" style="display:inline;">*</span></label>
												<input type="button" id="smallbutton" class="btn btn-block" onclick="execDaumPostcode()" value="주소검색" style="display:inline;">
												<div class="form-wrap">
													<input type="text" id="FIR_ADDRESS" placeholder="주소 검색을 선택해주세요." name="FIR_ADDRESS" value="${userDetail.FIR_ADDRESS}" readonly required>
												</div>
													<input type="text" id="SEC_ADDRESS" name="SEC_ADDRESS" value="${userDetail.SEC_ADDRESS}" required>				
													<input type="hidden" class="inputMaterial" id="postcode" readonly disabled>
													<input type="hidden" class="inputMaterial" id="extraAddress" placeholder="참고항목" disabled>
											</div>
										</div>												
										
										<div class="row">
											<div class="col-md-12">
												<label>연락처 <span class="required">*</span></label>
												<div class="form-wrap">
													<input type="text" id="PHONE" name="PHONE" value="${userDetail.PHONE}" size="40" required>
												</div>
											</div>
										</div>
										
										<div class="row">
											<div class="col-md-12">
												<label>성별 <span class="required">*</span></label>
												<div class="form-wrap">
													<input type="radio" name="GENDER" value="0" <c:if test='${userDetail.GENDER eq "0"}'>checked</c:if>>비공개&nbsp; &nbsp;
													<input type="radio" name="GENDER" value="1" <c:if test='${userDetail.GENDER eq "1"}'>checked</c:if>>남자&nbsp; &nbsp;
													<input type="radio" name="GENDER" value="2" <c:if test='${userDetail.GENDER eq "2"}'>checked</c:if>>여자
												</div>
											</div>
										</div>
										
										<div class="row">
											<div class="col-md-12">
												<div class="form-wrap">
													<button type="button" id="modify_button" class="btn btn-success">수정</button> <!-- type="submit"  -->
													<button type="button" title="취소" class="btn btn-default" onclick="javascipt:location.href='./';">취소</button>
												</div>
											</div>
										</div>
									</form>
								</div> <!-- /<div class="col-md-6 p-3"> -->
								
								
							<!-- 사이드바 -->
							<div class="col-md-3 col-md-pull-9"> 
								<div class="sidebar">
									<div class="widget widget-product-categories">
										<h3 class="widget-title">MY 쇼핑</h3>
										<ul class="product-categories">
											<li><a href="/rudisfarm/my-page/orders">주문 목록 </a></li>
											<li><a href="/rudisfarm/my-page/my-cart">찜 목록</a></li>
										</ul>
										<br>
										<h3 class="widget-title">MY 활동</h3>
										<ul class="product-categories">
											<li><a href="/rudisfarm/my-page/reviewlist">리뷰 목록</a></li>
										</ul>
										<br>
										<h3 class="widget-title">MY 정보</h3>
										<ul class="product-categories">
											<li><a href="/rudisfarm/my-page/my-info-modify-form">개인정보 조회/수정</a></li>
											<li><a href="/rudisfarm/my-page/out-check">회원 탈퇴</a></li>
										</ul>
									</div>
								</div>
							</div>
							<!-- 사이드바 -->
								
							</div> <!-- /row -->
						</div> <!-- /container -->
					</div> <!-- /section -->
				</div> <!-- /main -->
			<!-- /개인정보 수정 -->


		<jsp:include page="/resources/bootstrap/commons/footer.jsp" />
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

		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/core.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/widget.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/mouse.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/slider.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery.ui.touch-punch.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/price-slider.js"></script>
	</body>
</html>