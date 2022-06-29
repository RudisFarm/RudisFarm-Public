<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"/>
<jsp:include page="/resources/bootstrap/commons/head.jsp"/>
<link rel="shortcut icon" href="images/favicon.ico"/>
<title>Organik Shop &#8211; Find Id/Password | Organik HTML Template</title>

<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" type="text/css" media="all"/>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/font-awesome.min.css" type="text/css" media="all" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/ionicons.min.css" type="text/css" media="all" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/owl.carousel.css" type="text/css" media="all"/>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/owl.theme.css" type="text/css" media="all"/>
<link rel='stylesheet' href="<%= request.getContextPath() %>/resources/bootstrap/css/prettyPhoto.css" type='text/css' media='all'/>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/style.css" type="text/css" media="all"/>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/custom.css" type="text/css" media="all"/>
<link href="//fonts.googleapis.com/css?family=Great+Vibes%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/css/findUser.css" type="text/css" media="all" />

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
#pwinput::placeholder {color:#808080; font-weight: lighter ; font-size:90%;}
#findResultTable {width: 100%; border: 1px solid #444444; !important}
#notFindEmail {color:red; border:none;background:transparent; !important;}
#notInputEmail {color:red; border:none;background:transparent; !important;}
#emailCheckLabel {color:red; border:none;background:transparent; !important;}
#idCheckLabel {color:red; border:none;background:transparent; !important;}
#tdcolor{background-color:#F5F5F5; padding:15px; !important}
#codeCheckInput{color:red !important;}
#codeCheckInputNull{color:red !important;}
/* #problemA{word-wrap:break-word; float:left; !important;} */

#notFindPwEmail{color:red; border:none;background:transparent; !important;}
#notInputPwEmail{color:red; border:none;background:transparent; !important; }

#findPwLabel{border:none;background:transparent; !important;}
#findIdLabel{border:none;background:transparent; !important;}
#IdCheckinputOk{border:none;background:transparent; !important;}
#PwCheckinputOk{border:none;background:transparent; !important;}
#findIdResultMark{border:none;background:transparent; !important;}
#findJoinDateResultMark{border:none;background:transparent; !important;}
</style>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>
$(document).ready(function(){
	
	var emailVal = false;
	
	/* 아이디 찾기_가입된 이메일인지 확인하기 */
	$('#idEmailcheck').click(function(){
		console.log('이메일 유무 확인');
		
		$.ajax({
				url: "${pageContext.request.contextPath}/emailCheck",
				type: "GET",
				data:{
					"emailkCheckVal":$('#findIdEmail').val()
				},
				
				success: function(data){		
					if($.trim($('#findIdEmail').val()) == ''){
						/* 이메일이 비어있을 경우 */
						$("#notFindEmail").attr("style", "display:none");
						$("#notInputEmail").attr("style", "display:block");
						$("#findIdSubmit").attr("disabled", "ture");
						$("#findIdLabel").attr("style", "display:none");
						$("#IdCheckinputOk").attr("style", "display:none");
						emailVal = false;
						
					} else if(data == 0){
						/* 이메일이 디비에 없음 */
						console.log('이메일이 없을 경우' + data);
						$("#notFindEmail").attr("style", "display:block");
						$("#notInputEmail").attr("style", "display:none");
						$("#findIdSubmit").attr("disabled", "ture");
						$("#findIdLabel").attr("style", "display:none");
						$("#IdCheckinputOk").attr("style", "display:none");
						emailVal = false;

					} else if(data != 0) {
						/* 이메일이 입력 되었고 DB에 존재함 */
						console.log('이메일이 있을 경우' + data);
						$("#notFindEmail").attr("style", "display:none");
						$("#notInputEmail").attr("style", "display:none");
						$("#findIdSubmit").removeAttr("disabled");
						$("#findIdLabel").attr("style", "display:none");
						$("#IdCheckinputOk").attr("style", "display:block");
						alert('확인 되었습니다.');
						emailVal = true;

					} 
				},
				error:function(request,status,error){
			        alert("알 수 없는 문제가 발생하였습니다. 관리자에게 문의해주십시오."); // 실패 시 처리
				}
		});
	});
	
	
	
	
	/* 아이디 찾기  */
	$('#findIdSubmit').click(function(){
		console.log('아이디 찾기 키업1');
		
		if(!emailVal){
			alert("이메일을 먼저 확인해주세요.");
			$('#findIdEmail').focus();
			return;

		} else {
			$.ajax({
				type: 'POST',
				url: "${pageContext.request.contextPath}/buyer-findid/emailcheck",
				dataType: 'json',
				contentType: "application/json; charset=utf-8;",
				data: JSON.stringify({
					EMAIL:$('#findIdEmail').val(),
				}),
				
				success: function(data) {
					console.log('아이디 찾기 리턴 값 출력' + data);
					if(data != null && data.PLATFORM == 'rudisfarm') {
						console.log("아이디 조회 성공");
						console.log(data.USER_ID);
						console.log(data.JOINDATE);
						
						var idResult = "";
						var userid = data.USER_ID;
						var idLength = userid.length;
						
						/* 아이디 길이 반만큼 대체문자 주기 */
						for(var i = 0; i < idLength; i++){
							idResult += i < idLength/2 ? "*" : userid.charAt(i);
							}
						console.log(data.JOINDATE);
						var jdata = moment(data.JOINDATE).format("YYYY-MM-DD"); /* json 데이터는 날짜 형식이 달라서 format 지정함 */
	
						$("#idFindBefore").attr("style", "display:none");
						$("#idFindAfter").attr("style", "display:block");
						$("#findIdResultMark").attr("value", "아이디 :" + idResult);
						$("#findJoinDateResultMark").attr("value", "(가입일 : " + jdata + ")");
					} else if (data == null){
						$("#idFindBefore").attr("style", "display:block");
						$("#idFindAfter").attr("style", "display:none");
						alert("아이디 찾기가 실패했습니다. 잠시 후 다시 시도해주세요.");
						$("#findIdResultMark").attr("value", "");
						$("#findJoinDateResultMark").attr("value", "");
					} else if(data != null && data.PLATFORM != 'rudisfarm') {
						alert("소셜 로그인으로 가입하신 회원입니다. 루디스팜에 가입하셨던 플랫폼에서 아이디/비밀번호를 조회해주시기 바랍니다.");
					}
				},
				error: function() {
					console.log("에러 발생!");
				}
			}); //에이젝스
		}
	});
});
</script>

<script>
//비밀번호 찾기
$(document).ready(function(){
	
	var pwEmailVal = false;
	var pwCodeVal = false;
	
	/* 비밀번호 찾기_가입된 이메일인지 확인하기 */
	$('#pwEmailCheck').click(function(){
		console.log('비밀번호 찾기 가입된 이메일인지 확인 키업1');
		
		$.ajax({
				url: "${pageContext.request.contextPath}/emailCheck",
				type: "GET",
				data:{
					"emailkCheckVal":$('#findPwEmail').val()
				},
				
				success: function(data){		
					if($.trim($('#findPwEmail').val()) == ''){
						/* 이메일이 비어있을 경우 */
						$("#notFindPwEmail").attr("style", "display:none");
						$("#notInputPwEmail").attr("style", "display:block");
						$("#codeCheck").attr("disabled", "ture");
						$("#issueButton").attr("disabled", "ture");
						$("#findPwLabel").attr("style", "display:none");
						$("#PwCheckinputOk").attr("style", "display:none");
						pwEmailVal = false;

					} else if(data == 0){
						/* 이메일이 입력 되지 않음 */
						console.log('이메일이 디비에 없을 경우' + data);
						$("#notFindPwEmail").attr("style", "display:block");
						$("#notInputPwEmail").attr("style", "display:none");
						$("#codeCheck").attr("disabled", "ture");
						$("#issueButton").attr("disabled", "ture");
						$("#findPwLabel").attr("style", "display:none");
						$("#PwCheckinputOk").attr("style", "display:none");
						pwEmailVal = false;

					} else if(data != 0) {
						/* 이메일이 입력 되었고 DB에 존재함 */
						console.log('이메일이 디비에 있을 경우' + data);
						$("#notFindPwEmail").attr("style", "display:none");
						$("#notInputPwEmail").attr("style", "display:none");
						$("#codeCheck").removeAttr("disabled");
						$("#issueButton").removeAttr("disabled");
						$("#findPwLabel").attr("style", "display:none");
						$("#PwCheckinputOk").attr("style", "display:block");
						alert('확인 되었습니다.');
						pwEmailVal = true;

					} 
				},
				error:function(request,status,error){
			        alert("알 수 없는 문제가 발생하였습니다. 관리자에게 문의해주십시오."); // 실패 시 처리
				}
		});
	});
	
/*  // 난수 이메일 인증번호 만들어서 보내고 디비에 저장하기
	$('#issueButton').click(function(){
	    
	    var email = $('#findPwEmail').val(); // 이메일 가져오기
	    console.log('메일 펑션');
	    
	         $.ajax({
	        url:"mailCheck?email=" + email,
	        type:"GET",
	    }); 
	});
	 */
	
	//비밀번호 찾기 인증코드 이메일 보내기
	$('#issueButton').click(function(){
		console.log('비밀번호 찾기 인증코드 이메일 보내기 키업1');
		
		if(pwEmailVal == true) {
		
			$.ajax({
					url: "${pageContext.request.contextPath}/buyer-findpw/emailcheck",
					type: "POST",
					dataType: 'json',
					contentType: "application/json; charset=utf-8;",
					data: JSON.stringify({
						"EMAIL":$('#findPwEmail').val()
						}),
					
					success: function(data){
						if(data.resultCode == 1) {
							alert("회원님께서 입력하신 주소로 인증코드가 전송되었습니다");
							certifyTimer();
							$("#timer").css("style", "display:block");
						} else {
							alert("인증코드 전송에 실패했습니다. 다시 시도해주세요.");
						}
					},
					error: function(e) {
						console.log("에러 발생!");
						console.log(e);
					}
			});
		} else {
			alert('이메일이 먼저 확인되어야 합니다.');
			
		}
	});
	
	
	/* 비밀번호 찾기 인증코드 일치 검사 */
	$('#issuCodeCheck').click(function(){
		console.log('비밀번호 찾기 이메일 인증코드 일치 검사 키업1');
	
		$.ajax({
			type : 'POST',         
			url: '${pageContext.request.contextPath}/buyer-findpw/emailcheckresult', 
			dataType: 'json',
			contentType: 'application/json; charset=utf-8;',
			data : JSON.stringify({
				EMAIL: $('#findPwEmail').val(),
				CHECK_KEY: $('#codeCheck').val()
			}),
	
			success: function(data){
				
				if($.trim($('#codeCheck').val()) == ''){
					/* 인증 번호가 비어있음 */
					console.log('인증번호가 비었음' + data);
					$("#codeCheckInputNull").attr("style", "display:block");
					$("#codeCheckInput").attr("style", "display:none");
					pwCodeVal = false;
	
				}else if(data.resultCode == 0){
					console.log('인증 번호 다르거나 시간을 초과');
					$("#codeCheckInput").attr("style", "display:block");
					$("#codeCheckInputNull").attr("style", "display:none");
					pwCodeVal = false;
				
				}else if(data.resultCode == 1) {
					console.log('인증 번호 같음');
					$("#codeCheckInput").attr("style", "display:none");
					$("#codeCheckInputNull").attr("style", "display:none");
					$("#timer").attr("style", "display:none");
					alert('확인 되었습니다.')
					pwCodeVal = true;
				}
			},
			error:function(e){
		        alert("알 수 없는 문제가 발생하였습니다. 관리자에게 문의해주십시오."); // 실패 시 처리
		        console.log("에러 발생!");
				console.log(e);
				pwCodeVal = false;
		       },
			});
	});
	
	/* 임시 비밀번호 만들고 이메일에 값 표시해서 보내기 */
	$('#findPwSubmit').click(function(){
		console.log('임시비밀번호 보내기 submit 키업1');
		console.log('pwEmailVal : ' + pwEmailVal);
		console.log('pwCodeVal : ' + pwCodeVal);
		
		if(pwEmailVal == false){
			alert('이메일을 먼저 확인해주세요.');
			return;
		}else if(pwCodeVal == false){
			alert('인증코드를 먼저 확인해주세요.');
			return;
		} else {
			$.ajax({
					url: "${pageContext.request.contextPath}/buyer-findpw/emailcheckupdate",
					type: "POST",
					dataType : 'json',
					contentType: 'application/json; charset=utf-8;',
					data : JSON.stringify({
						"EMAIL":$('#findPwEmail').val()
					}),
					
					success: function(data){
						if(data.resultCode == 99){
							alert("소셜 로그인 회원입니다. 루디스팜에 가입하셨던 플랫폼에서 아이디/비밀번호를 조회해주시기 바랍니다.");
						} else if(data.resultCode == 1){
							alert("회원님께서 입력하신 주소로 임시 비밀번호가 전송되었습니다.");
							console.log('메일 감');
						} else {
							alert("메일 전송에 실패했습니다. 다시 시도해주십시오.");
						}
					},
					error:function(e){
				        alert("알 수 없는 문제가 발생하였습니다. 관리자에게 문의해주십시오."); // 실패 시 처리
				        console.log("에러 발생!");
						console.log(e);
					}
			}); //에이젝스
		}
	}); //이메일 보내기
	
		if(window.matchMedia("(max-width:996px)").matches) {
			document.getElementById("pwEmailCheck").className = "btn btn-block";
			document.getElementById("idEmailcheck").className = "btn btn-block";
			document.getElementById("issueButton").className = "btn btn-block";
		}else {
			document.getElementById("pwEmailCheck").className = "";
			document.getElementById("idEmailcheck").className = "";
			document.getElementById("issueButton").className = "";
		} 
	
}); //레디

//반응형 버튼
$(window).resize(function() {
	if(window.matchMedia("(max-width:996px)").matches) {
		document.getElementById("pwEmailCheck").className = "btn btn-block";
		document.getElementById("idEmailcheck").className = "btn btn-block";
		document.getElementById("issueButton").className = "btn btn-block";
	}else {
		document.getElementById("pwEmailCheck").className = "";
		document.getElementById("idEmailcheck").className = "";
		document.getElementById("issueButton").className = "";
	} 
});


// 타이머
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


</script>
<script>
/* 메뉴로 탭 전환하기 */
$(document).ready(function() {
	$('.tabs .tab').click(function() {
		if ($(this).hasClass('findId')) {
			$('.tabs .tab').removeClass('active');
			$(this).addClass('active');
			$('.cont').hide();
			$('.findId-cont').show();
		}
		if ($(this).hasClass('findPw')) {
			$('.tabs .tab').removeClass('active');
			$(this).addClass('active');
			$('.cont').hide();
			$('.findPw-cont').show();
		}
	});
});
</script>
<script>
/* 버튼 탭 전환하기 */
$(document).ready(function() {
	$('#pwChange').click(function() {
		$('.tabs .tab').removeClass('active');
		$('#tabPw').addClass('active');
		$('.cont').hide();
		$('.findPw-cont').show();
	});
	$('#idChange').click(function() {
		$('.tabs .tab').removeClass('active');
		$('#tabId').addClass('active');
		$('.cont').hide();
		$('.findId-cont').show();
	});
});		
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
								<h2 class="page-title text-center">계정 정보 찾기</h2>
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
									<li><a href="find">아이디ㆍ비밀번호 찾기</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				
				
				
				<!-- 아이디 비밀번호 찾기 시작 -->
				<section class="container">
				<article class="half">
				<br>
					<h4>계정 정보 찾기</h4>
					<div class="col-md-3 col-sm-2"></div>
					<div class="col-md-6 col-sm-8"> <!-- p-3  -->
						<div class="tabs" >
							<span class="tab findId active" id="tabId"><a href="#findId">아이디 찾기</a></span>
							<span class="tab findPw" id="tabPw"><a href="#findPw">비밀번호 찾기</a></span>
						</div>
						<div class="content">
							<div class="findId-cont cont">
								<div id="idFindBefore" style="display:block;">
									<div class="col-md-8">
										<input type="email" name="EMAIL" id="findIdEmail" class="inpt" required="required" placeholder="이메일"> 
									</div>
									<div class="col-md-2" >
										<button id="idEmailcheck" type="button" style="white-space:nowrap;">이메일 확인</button>
									</div>
									<input type="text" id="findIdLabel" value="찾으시는 계정의 이메일을 입력해주세요." readonly>
									<input type="text" id="notFindEmail" style="color:red;font-size:90%;display:none;" value="가입되지 않은 이메일 주소입니다." readonly>
									<input type="text" id="notInputEmail" style="color:red;font-size:90%;display:none;" value="이메일이 입력되지 않았습니다." readonly>
									<input type="text" id="IdCheckinputOk" style="display:none;" value=" " readonly>
								</div>
								<div id="idFindAfter" style="display:none;">
									<h5>회원님의 아이디 찾기가 완료 되었습니다.</h5> 
									<br>
									<table id="findResultTable">
									<tr>
										<td id="tdcolor">해당 정보로 가입된 아이디는 다음과 같습니다.</td>
									</tr>
									<tr>
										<td>
											<input type="text" id="findIdResultMark" value="" readonly>
											<input type="text" id="findJoinDateResultMark" value="" style="color:#87CEEB;" readonly>
										</td>
									</tr>
									
									</table>
									<a href="/rudisfarm/login" class="more" style="float:right;">로그인 화면으로</a>						
								</div>
									
									<div style="float:right;display:inline;">
									<br><br><br>
										<label style="display:inline;float:right;">비밀번호가 기억나지 않는다면?</label>
										  <a class="nav-link" id="pwChange" style="display:inline;cursor:pointer;margin-bottom:10px;">비밀번호 찾기</a>
									</div><br><br><br><br>
									<div class="submit-wrap">
										<input id="findIdSubmit" type="submit" value="아이디 찾기 " class="submit">
										<a href="/rudisfarm" class="more">메인화면으로</a><br><br>
									</div>
							</div>
							
							<div class="findPw-cont cont">
									<!-- <div class="row"> -->
										<div class="col-md-8 col-sm-8">
											<input type="email" id="findPwEmail" class="inpt" placeholder="이메일" >
										</div>
										<div class="col-md-2 col-sm-4" >
											<button id="pwEmailCheck" type="button" style="white-space:nowrap;">이메일 확인</button>
										</div>
									<!-- </div> -->
										<div id="problemA">
											<input type="text" id="findPwLabel" value="찾으시는 계정의 이메일을 입력해주세요." readonly>
											<input type="text" id="notFindPwEmail" style="display:none;" value="가입되지 않은 이메일 주소입니다." readonly>
											<input type="text" id="notInputPwEmail" style="display:none;" value="이메일이 입력되지 않았습니다." readonly>
											<input type="text" id="PwCheckinputOk" style="display:none;" readonly>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label id="timer"></label>
										</div>
										
										<div class="col-md-8 col-sm-12">
											<input type="text" name="codeCheck" id="codeCheck" class="inpt" required="required" placeholder="인증번호" style="display:inline;" disabled> 
										</div>
										<div class="col-md-4 col-sm-12">
											<button type="button" id="issueButton" class="btn" style="white-space:nowrap;"><strong>인증키 발급</strong></button>
										</div>
										
										&nbsp;
										
										<div class="col-md-12 col-sm-12">
											<button type="button" id="issuCodeCheck" class="btn btn-block" style="white-space:nowrap;"><strong>확인</strong></button>
										</div>
										
										<div class="row col-lg-12 col-md-12 col-sm-12">
											<div class="col-lg-1 col-md-1 col-sm-1"></div>
											
										</div>
										
										<div class="col-md-1 col-lg-1 col-sm-1"></div>														
										<div class="row col-md-8 col-lg-8 col-sm-8">
											<label id="codeCheckInput" style="color:red;font-size:90%;display:none;">인증번호가 틀렸거나 시간을 초과했습니다.</label>
											<label id="codeCheckInputNull" style="color:red;font-size:90%;display:none;">값이 비어 있습니다.</label>
										</div>
									<div style="float:right;display:inline;">
									<br>
										<label style="display:inline;" style="color:#263238;">아이디가 기억나지 않는다면?</label>
										  <a class="nav-link" id="idChange" style="display:inline;cursor:pointer;">아이디 찾기</a>
									</div><br>
									<div class="submit-wrap">
										<input id="findPwSubmit" type="submit" value="비밀번호 찾기 이메일 보내기" class="submit">
										<a href="/rudisfarm" class="more">메인화면으로</a><br><br>
									</div>
							</div>
						</div>
					</div>
					</div>
					<!-- <div class="col-md-1"></div> -->
				</article>
			</section>
			<!-- 아이디 찾기 비밀번호 찾기 끝 -->
			</div>
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