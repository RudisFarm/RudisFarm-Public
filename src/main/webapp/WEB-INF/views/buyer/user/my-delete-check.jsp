<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"/>
<jsp:include page="/resources/bootstrap/commons/head.jsp"/>
<link rel="shortcut icon" href="images/favicon.ico"/>
<title>RudisFarm &#8211; withdrawal</title>

<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" type="text/css" media="all"/>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/font-awesome.min.css" type="text/css" media="all" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/ionicons.min.css" type="text/css" media="all" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/owl.carousel.css" type="text/css" media="all"/>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/owl.theme.css" type="text/css" media="all"/>
<link rel='stylesheet' href="<%= request.getContextPath() %>/resources/bootstrap/css/prettyPhoto.css" type='text/css' media='all'/>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/style.css" type="text/css" media="all"/>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/custom.css" type="text/css" media="all"/>
<link href="//fonts.googleapis.com/css?family=Great+Vibes%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet"/>
<style>
#outTable {width: 100%; border: 1px solid #444444; !important}
#tableTerms {padding:15px; !important}
tr, td {padding:15px;  !important}
#tableTerms{background-color:#F5F5F5; !important}
#userOut{color:#87CEFA; !important}
#outCheckTable {text-align:center; !important}
/* #timer {position:absolute; right:350px; bottom:140px; !important} */

</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

/* 비밀번호 확인 */
 $(document).ready(function(){
	 
 		var mailck = false;
 		var passck = false;
 		var userPlatform = "<c:out value='${userDetail.PLATFORM}'/>"; 
		console.log(userPlatform);
 		
		$('#userPwdCheckButton').click(function(){
			var passCheckId = $("#USER_ID").val();
			var passCheckPwd = $("#PASSWORD").val();
			console.log('USER_ID' + passCheckId);
			console.log('PASSWORD' + passCheckPwd);

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
					console.log('비밀번호 확인 스크립트');
					/* var result = data["result"]; 
					console.log('result : ' + result);*/
						
					if(data == false || $.trim($('#PASSWORD').val()) == '' ){
						console.log('비밀번호가 일치하지 않을 경우');
						$("#PASSWORD").css("background-color", "#ffeded");
				        /* $("#userOutIssuButton").attr("disabled", "true"); */
				        alert("비밀번호가 일치하지 않습니다."); 
				        passck = false;

					} else if(data == true && $.trim($('#PASSWORD').val()) != '' ) {
						console.log('저장된 비밀번호와 같을 경우');
						$("#PASSWORD").css("background-color", "#eeffed");
						
						//인증 버튼 활성화
						/* $("#userOutIssuButton").removeAttr("disabled"); */ 
						passck = true;
					}
				},
				error:function(request,status,error){
					console.log('비밀번호 확인 스크립트 실패시');
			        alert("알 수 없는 문제가 발생했습니다. 관리자에게 문의해주십시오."); // 실패 시 처리
				}
		});
	});
		
		/* 탈퇴 본인 인증 메일 보내기 */
		$('#userOutIssuButton').click(function(){
			console.log('탈퇴 본인 확인 인증코드 메일 보내기 스크립트');
			var tmpp = $("#userOut").prop("checked");
			
			
			if(tmpp){
	    		console.log('약관에 동의함');
				/* $("#PASSWORD").removeAttr("disabled"); */
				$.ajax({
					url: "${pageContext.request.contextPath}/my-page/buyer-out/emailcheck",
					type: "POST",
					dataType: 'json',
					contentType: "application/json; charset=utf-8;",
					data: JSON.stringify({
						"EMAIL":$('#EMAIL').val()
						}),
					
					success: function(data){
						if(data.resultCode == 1) {
							alert("회원님의 이메일 주소로 인증코드가 전송되었습니다.");
							$("#timer").css("display", "inline");
							certifyTimer();
						} else {
							alert("인증코드 전송에 실패했습니다. 다시 시도해주세요.");
							/* $("#outIssuCode").attr("disabled", "true"); */
						}
					},
					error: function(e) {
						console.log("에러 발생!");
						console.log(e);
					}
				});
			} else {
	    		console.log('약관에 동의하지 않음');
	    		alert("먼저 약관에 동의해주십시오.");
	    		this.blur();
		    	}
		});

		
		
		/* 탈퇴 약관 동의 체크박스 */
		    $("#userOut").click(function(){
				var tmpp = $("#userOut").prop("checked");
				
				if(tmpp){
		    		console.log('약관에 동의함');
					/* $("#PASSWORD").removeAttr("disabled"); */

				} else {
		    		console.log('약관에 동의하지 않음');
			        document.getElementById("PASSWORD").value ='';	        
			       /*  $("#PASSWORD").attr("disabled", "true"); */
			     }	
		    });
			
		    /* 약관 동의 전에 비밀번호 버튼 누를때 */
		    $("#PASSWORD").click(function(){
				var tmpp = $("#userOut").prop("checked");

		    	if(tmpp){
		    		console.log('약관에 동의함');
		    	} else {
		    		console.log('약관에 동의하지 않음');
		    		alert("먼저 약관에 동의해주십시오.");
		    		this.blur();
		    	}
		    });
		    
		    /* 탈퇴 인증코드 일치 검사 */
			$('#userCodeCheckButton').click(function(){
				console.log('비밀번호 찾기 이메일 인증코드 일치 검사 키업1');

				$.ajax({
					type : 'POST',         
					url: '${pageContext.request.contextPath}/my-page/buyer-out/emailcheckresult', 
					dataType: 'json',
					contentType: 'application/json; charset=utf-8;',
					data : JSON.stringify({
						EMAIL: $('#EMAIL').val(),
						CHECK_KEY: $('#outIssuCode').val()
					}),

					success: function(data){
						
						if($.trim($('#outIssuCode').val()) == ''){
							/* 인증 번호가 비어있음 */
							console.log('인증번호가 비었음' + data);
							alert("인증 번호가 비어 있습니다.");
							/* $("#userOutSubmit").attr("disabled", "true"); */
							mailck = false;

						}else if(data.resultCode == 0){
							console.log('인증 번호 다르거나 시간을 초과');
							alert("인증에 실패하였습니다.");
							/* $("#userOutSubmit").attr("disabled", "true"); */
							mailck = false;
						
						}else if(data.resultCode == 1) {
							console.log('인증 번호 같음');
							alert("본인 확인에 성공하였습니다.");
							/* $("#userOutSubmit").removeAttr("disabled"); */
							$("#timer").css("display", "none");
							mailck = true;
						}
					},
					error:function(e){
				        alert("알 수 없는 문제가 발생하였습니다. 관리자에게 문의해주십시오."); // 실패 시 처리
				        console.log("에러 발생!");
						console.log(e);
				       },
					});
			});
		    
		    /* 탈퇴 버튼  누를때*/
			$("#userOutSubmit").click(function(){
				if(userPlatform != 'rudisfarm'){
					/* mailck = true; */
					passck = true;
				}
				
				if(mailck == false){
					alert("메일 인증을 먼저 해주세요.");
					return;
				} 
				 		 
				if (passck == false){
					alert("비밀번호 인증을 먼저 해주세요.");
					return;
				}
				
				
				var outConfirm = confirm("정말 루디스팜 회원을 탈퇴하시겠습니까?");

			    if ( outConfirm == true ) {
			    		 if(userPlatform == 'rudisfarm' || userPlatform == 'naver'){
			    			 var url
			    			 if(userPlatform == 'rudisfarm') {
			    				 url = '/rudisfarm/my-page/out';
			    			 }else if(userPlatform == 'naver') {
			    				 url = '/rudisfarm/my-page/socialout';
			    				 console.log("네이버 소셜 로그인 연동 해제")
			    			 }
			    			 
					    	$.ajax({
								type: 'put',
								url: url, 
								dataType: 'json',
								contentType: "application/json; charset=utf-8;",
								/* data: JSON.stringify({
									checkid: $("#USER_ID").val(),
								}),  */
								success: function(data) {
									console.log("탈퇴 성공");
									console.log('data' + data);
									if(data.resultCode == 1) {
										if(userPlatform == 'naver'){
											alert("회원 탈퇴에 성공했습니다. 네이버 회원의 경우 완전히 탈퇴하기 위해서는 직접 네이버에서 '보안설정-연결된 서비스 관리-정보제공을 철회'를 진행하셔야 합니다.");
										} else {
											alert("회원 탈퇴에 성공했습니다.");
										}
										location.href="/rudisfarm/logout";
									} else {
										alert("회원 탈퇴에 실패하였습니다. 잠시 후 다시 시도해주세요.");
										location.href="/rudisfarm";
									}
								},
								error: function(e) {
									console.log("에러 발생!");
									console.log(e);
									}
								});
			    			} else {
			    				console.log("카카오 또는 구글 소셜 로그인 연동 해제");
					    		
			    				if(userPlatform == 'kakao') {
									unlinkWithKakao();
								} else if(userPlatform == 'google') {
//	 								unlinkWithGoogle();
								}
			    			}
			    } //탈퇴 confirm

		}); //userOutSubmit 누를때
		
		//타이머
		function certifyTimer(){
			var time = 59;
			var sec ="";
			
			var x =setInterval(function() {
				sec = time%60;
				$("#timer").css("color", "red");

				document.getElementById("timer").innerHTML =  /* min + */"남은시간:"+ sec + "초";
				time--;

				//타임아웃시
				if(time<0) {
					clearInterval(x);
					document.getElementById("timer").innerHTML = "시간 초과";
					}
				}, 1000);

		} //타이머
		
	}); // 스크립트 ready
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
								<h2 class="page-title text-center">회원 탈퇴</h2>
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
									<li>회원 탈퇴</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- 회원 탈퇴 시작 -->
				<div class="section pt-7 pb-7">
					<div class="container">
						<div class="row">
							<div class="col-md-9 col-md-push-3">
 								<!-- <div class="col-md-2"></div>
								<div class="col-md-8 p-3"> -->
								<div class="commerce">
										<input type="hidden" name="_method" value="delete" />
											<div style=text-align:center;>
												<h2>회원 탈퇴</h2>
												<hr class="one">
												사이트를 이용하는데 불편함이 있으시다면 관리자에게 문의해주세요, 성심있게 답변 드리겠습니다.<br><br>
											</div>
											<div class="form-group">
												<table id="outTable">
													<tr>
														<td>
														<p>회원 탈퇴 안내 사항</p>
														<p>회원 탈퇴에 앞서 유의사항을 확인해 주십시오.<br>
															회원 탈퇴 시 회원전용 웹 서비스는 이용할 수 없게 됩니다. 회원은 상품의 구매 및 게시, 구매 내용과 판매 내역 같은 거래정보 열람이 제한되며, 
															해당 거래명세는 전자상거래 소비자 보호 법률에 따라 만료기간까지 보관 후 자동 폐기됩니다.
															저희 루디스팜 서비스에 입력하신 회원님께서 작성한 상품 후기, 댓글은 탈퇴에 따라 자동으로 삭제되지 않으며, 
															회원 탈퇴 이후에는 작성자 본인임을 확인할 수 없으므로 수정 및 삭제에 대한 권리 주장이 원천적으로 불가능해집니다. 
															탈퇴 이후 후기 및 댓글 등의 게시물 삭제가 필요하신 경우에는 먼저 삭제한 다음 탈퇴를 진행하여 주십시오.
															이미 결제된 상품은 탈퇴를 사유로 취소되지 않습니다. 추후 결제에 대한 문의사항이 있는 경우 따로 판매자에게 연락해주시기를 바랍니다.</p>
															<hr class="one">
															<p>소셜 로그인 회원은 이용 중이신 사이트의 설정에서 연동을 해제해야 완전한 탈퇴가 가능합니다.</p>
														</td>
													</tr>
													<tr>
														<td  id="tableTerms">
														<label><input type="checkbox" id="userOut" name="userOut" value="red"> 명시된 루디스팜 회원 탈퇴 약관을 확인하였으며 이에 동의합니다.</label>
														</td>
													</tr>										
												</table>
											</div>
											<div class="row">
												<div class="col-md-1"></div>
												<div class="form-group col-md-9" >
													<label id="outText">보안을 위하여 다시 한번 인증이 필요합니다.</label>
													<table id="outCheckTable">
														<!-- <tr>
															<td  colspan="2"><div class="col-md-12">보안을 위하여 다시 한번 인증이 필요합니다</div></td>
														</tr> -->
														<c:set var="userPlatformVar" value="${userDetail.PLATFORM}" />
	       	                                    		<c:choose> 
		                                           			<c:when test="${userPlatformVar eq 'rudisfarm'}">
																<tr>
																	<td>아이디</td>
																	<td>
																		<div class="row">
																			<div class="col-md-12">
																				<input type="text" id="USER_ID" value="${userDetail.USER_ID}" style="background-color:#ECECEC" size="40" readonly>
																			</div>
																		</div>
																	</td>
																</tr>
															
															</c:when>
		                                           			<c:otherwise>
		                                           				<tr style="display:none;">
																	<td>아이디</td>
																	<td>
																		<div class="col-md-12 ">
																			<input type="text" id="USER_ID" value="${userDetail.USER_ID}" style="background-color: #FAFAFA;" readonly>
		                                           						</div>
																	</td>
																</tr>
		                                           			</c:otherwise>
														</c:choose>
	
														<c:set var="userPlatformVar" value="${userDetail.PLATFORM}" />
		                                           		<c:choose> 
		                                           			<c:when test="${userPlatformVar eq 'rudisfarm'}">
																<tr>
																	<td>비밀번호</td>
																	<td>
																		<div class="col">
																			<div class="row">
																				<div class="col-xs-12 col-sm-9 col-md-9">
																					<input type="password" placeholder="비밀번호" id="PASSWORD" name="PASSWORD" style="display:inline;">
																				</div>
																				<div class="col-xs-12 col-sm-3 col-md-3" style="display:inline;float:left;">
																					<button type="button" id="userPwdCheckButton" style="display:inline;white-space:nowrap;float:left;">비밀번호 확인</button>	
																				</div>
																			</div>
																		</div>
																	</td>
																</tr>
															</c:when>
			                                           		<c:otherwise></c:otherwise>
														</c:choose>
														
														<tr>
															<td>이메일</td>
															<td>
																<div class="col">
																	<div class="row">
																		<div class="col-xs-12 col-sm-9 col-md-9">
																			<input type="text" value="${userDetail.EMAIL}" id="EMAIL" name="EMAIL" style="display:inline;background-color: #ECECEC;" readonly>
																		</div>
																		<div class="col-xs-12 col-sm-3 col-md-3" style="display:inline;float:left;">
																			<button type="button" id="userOutIssuButton" style="display:inline;white-space:nowrap;float:left;">메일인증 발송</button>	
																		</div>
																	</div>
																</div>
															</td>
														</tr>
														<tr>
															<td>메일 인증번호</td> 
															<td>
																<div class="col">
																	<div class="row">
																		<div class="col-xs-12 col-sm-9 col-md-9">
																			<input type="password" placeholder="인증번호" id="outIssuCode" name="outIssuCode" style="display:inline;">
																		</div>
																		<div class="col-xs-12 col-sm-3 col-md-3" style="display:inline;float:left;">
																			<button type="button" id="userCodeCheckButton" style="display:inline;white-space:nowrap;float:left;">인증번호 확인</button>	
																		</div>
																		
																	</div>
																</div>
															</td>
														</tr>
														<tr>
															<td></td>
															<td>
																<div id="timer" class="timer" style="text-align:left;"></div> 
															</td>
														</tr>
													</table>
												</div> <!-- /form-group -->
											</div> <!-- /row -->
									</div>
									<div class="text-center">
										<button type="button" id="userOutSubmit">탈퇴</button>
										<input type="button" value="취소" onclick="javascipt:location.href='../';" />
									</div>
								</div>
								
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
							
							<!-- <div class="col-md-3"></div> -->
						</div> <!-- /section -->
 					</div> <!-- /section -->
	 			<!-- <div class="col-md-2"></div> -->
			</div> <!-- /메인 -->
			<!-- /회원 탈퇴 끝 -->
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
	</body>
</html>