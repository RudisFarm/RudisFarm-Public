<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  String ctx = request.getContextPath(); //콘텍스트명 얻어오기.
  response.setHeader("Pragma-directive", "no-cache");
  response.setHeader("Cache-directive", "no-cache");
  response.setHeader("Pragma", "no-cache");
  response.setHeader("Cache-Control", "no-cache");
  response.setDateHeader("Expires",0); 
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Imagetoolbar" content="no" /><link rel="shortcut icon" href="images/favicon.ico"/>

<title>RudisFarm &#8211; join</title>

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
#idCheckLabelEmp {color:red !important;}
#emailCheckLabelEmp {color:red !important;}
#emailCheckLabel {color:red !important;}
#idCheckLabel {color:red !important;}
#sectionPidding{padding:10px !important;}


/* @media screen and (min-width:50px ) and (max-widthd:600px ){ 

	document.getElementById("#idCheck").className = "btn btn-success btn-block";
	

	/* #idCheck {

		element.className = 'btn btn-success btn-block';
		}

} */
</style>

<jsp:include page="/resources/bootstrap/commons/head.jsp"/>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(e){
		
		var RegExp = /^[a-zA-Z0-9]{4,12}$/; //id와 pwassword 유효성 정규식
        var n_RegExp = /^[가-힣a-zA-Z]{2,15}$/; //이름 유효성  정규식
        var p_RegExp = /^[0-9]{11,13}$/; //핸드폰 유효성 정규식
        
        var objId = document.getElementById("USER_ID"); //아이디
        var objPwd = document.getElementById("PASSWORD"); //비밀번호
        var objPwd2 = document.getElementById("PASSWORD_CHECK"); //비밀번호확인
        var objName = document.getElementById("USER_NAME"); //이름
        var objPhone = document.getElementById("PHONE"); //핸드폰
		
		var idx = false;
		var capx = false;
        
		/* 가입 버튼 누를시 유효성 검사 */
		$('#signUp').click(function(){
			var pushData = JSON.stringify({
				emailkCheckVal: $('#EMAIL').val()
			});

			if($.trim($('#USER_ID').val()) == ''){
				alert("아이디를 입력해주세요.");
				$('#USER_ID').focus();
				return;
			
			}  else if($.trim($('#PASSWORD').val()) == ''){
				alert("비밀번호를 입력해주세요.");
				$('#PASSWORD').focus();
				return;
			
			} else if(!RegExp.test(objPwd.value)){ //패스워드 유효성검사
	            alert("비밀번호는 4~12자의 영문 대소문자와 숫자만 가능합니다.");
				$('#PASSWORD').focus();
	            return;
	            
	        } else if(objPwd.value==objId.value){ //패스워드와 ID가 동일한지 검사
	            alert("아이디와 비밀번호는 동일할 수 없습니다.");
				$('#PASSWORD').focus();
	            return;
	            
	        } else if($('#PASSWORD').val() != $('#PASSWORD_CHECK').val()){
				alert('비밀번호가 다릅니다.');
				$('#PASSWORD_CHECK').focus();
				return;

			} else if($.trim($('#EMAIL').val()) == ''){
				alert("이메일을 입력해주세요.");
				$('#EMAIL').focus();
				return;

			} else if($.trim($('#USER_NAME').val()) == ''){
				alert("이름을 입력해주세요.");
				$('#USER_NAME').focus();
				return;
				
			} else if(!n_RegExp.test(objName.value)){
	            alert("이름은 2~15글자의 한글 및 영어로만 가능합니다.");
				$('#USER_NAME').focus();
	            return;
				
			} else if($.trim($('#FIR_ADDRESS').val()) == ''){
				console.log($('#FIR_ADDRESS').val())
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
				$('#PHONE').focus();
	            return;
				
			} else if($.trim($('#BIRTHDATE').val()) == ''){
				alert("생일을 입력해주세요.");
				$('#BIRTHDATE').focus();
				return;
				
			} else if(idx==false){
				alert("아이디 중복체크를 해주세요.");
				return;
	
			} else if(capx==false){
				alert("하단의 인증 문자열을 정확히 입력하고 확인해주세요.");
				return;

			} else {
				console.log(capx);
				alert("루디스팜 회원 가입을 축하드립니다!");
				$('#joinForm').submit();
			}
		});
		
		/* 아이디 중복 체크 */
		$('#idCheck').click(function(){
			$.ajax({
				url: "${pageContext.request.contextPath}/idCheck",
				type: "GET",
				data:{
					"idcheckval":$('#USER_ID').val()
				},
				success: function(data){
					if($.trim($('#USER_ID').val()) == ''){
						console.log('아이디가 입력되지 않았습니다');
						$("#USER_ID").css("background-color", "#ffeded");
						$("#idCheckLabelEmp").attr("style", "display:block");
						$("#idCheckLabel").attr("style", "display:none");
						$("#idCheckIcon").attr("style", "display:none");
					} else if(!RegExp.test(objId.value)){ //아이디 유효성검사
			            alert("아이디는 4~12 글자의 영문 대소문자와 숫자만 가능합니다.");
						$('#USER_ID').removeAttr("readonly");
						$('#USER_ID').val() == '';
						$('#USER_ID').focus();
						$("#idCheckLabelEmp").attr("style", "display:none");
						$("#idCheckLabel").attr("style", "display:none");
						$("#idCheckIcon").attr("style", "display:none");
					} else if(data == 1){
						console.log('중복이 있어 쓸 수 없는 id');
						$("#USER_ID").val('');
						$("#USER_ID").css("background-color", "#ffeded");
						$("#idCheckLabelEmp").attr("style", "display:none");
						$("#idCheckLabel").attr("style", "display:block");
						$("#idCheckIcon").attr("style", "display:none");
					} else if(data == 0){
						idx=true;
						
						console.log('사용할 수 있는 id');
						$('#USER_ID').attr("readonly",true);
						$("#USER_ID").css("background-color", "#eeffed");
						$("#idCheckLabelEmp").attr("style", "display:none");
						$("#idCheckLabel").attr("style", "display:none");
						$("#idCheckIcon").attr("style", "display:block");
					}
				},
				error: function(){
					alert("서버에러");
				}
			});
		});
		
	/* 캡차(문자만 했음)*/

	 function changeCaptcha() {
	  $('#catpcha').html('<img src="/rudisfarm/captcha/CaptChaImg?rand='+ Math.random() + '"/>');
	 }

	/*  function winPlayer(objUrl) {
		 alert(objUrl);
	  $('#audiocatpch').html(' <bgsound src="' + objUrl + '">');
	 } */
	 
	 function audioCaptcha() {
		   var uAgent = navigator.userAgent;
		   /* var soundUrl = '/rudisfarm//captcha/CaptChaAudio'; */
		   if (uAgent.indexOf('Trident') > -1 || uAgent.indexOf('MSIE') > -1) {
		       //IE일 경우 호출
		       winPlayer(soundUrl+'?agent=msie&rand='+ Math.random());
		       /*}  else if (!!document.createElement('audio').canPlayType) {
		       //Chrome일 경우 호출
		       try { new Audio(soundUrl).play(); } catch(e) { winPlayer(soundUrl); } */
		   } else window.open(soundUrl, '', 'width=1,height=1');
		 }
	 
	 //처음 캡차 호출
		changeCaptcha(); //Captcha Image 요청
		$('#reLoad').click(function(){ 
	  		changeCaptcha(); 
	  	});

		  //확인 버튼 누르고 값 비교할때
		  $('#frmSubmit').click(function(){
		      if ( !$('#answer').val() ) {
		           alert('이미지에 보이는 숫자를 정확히 입력해 주세요.');
		      } else {
		           $.ajax({
		               url: '/rudisfarm/captcha/CaptchaSubmit.do',
		               type: 'POST',
		               //dataType: 'text',
		               data: 'answer=' + $('#answer').val(),
		               async: false,  
		               success: function(resp) {
		                    if(resp=="s"){
		                    	capx = true;
		                    	console.log(capx);
		                    	alert("입력값이 일치합니다.");
		                    }else{
		                    	capx = false;
		                    	console.log(capx);
		                    	alert("입력값이 일치하지 않습니다.");
		                    	
		                    }
	                    //$('#reLoad').click();
	                    //$('#answer').val('');
	              }
	         });
	      }
		}); //캡차 비교

		/* if (Modernizr.mq('(max-width: 767px)')) {
			document.getElementById("idCheck").className = "btn btn-success btn-block";
		} else {
			document.getElementById("idCheck").className = "btn";
		} */
		
		
/* 		if(matchMedia("screen and(max-width:767px)").matches){
			document.getElementById("idCheck").className = "btn btn-success btn-block";
		}else {
			document.getElementById("idCheck").className = "btn";
		} */
		
		  if(window.matchMedia("(max-width:768px)").matches) {
				document.getElementById("idCheck").className = "btn btn-block";
				document.getElementById("issueButton").className = "btn btn-block";
				document.getElementById("mailCodeCheckButton").className = "btn btn-block";
			}else {
				document.getElementById("idCheck").className = "";
				document.getElementById("issueButton").className = "";
				document.getElementById("mailCodeCheckButton").className = "";
			} 
		
	});// 레디
	
	
	$(window).resize(function() {
		if(window.matchMedia("(max-width:768px)").matches) {
			document.getElementById("idCheck").className = "btn btn-block";
			document.getElementById("issueButton").className = "btn btn-block";
			document.getElementById("mailCodeCheckButton").className = "btn btn-block";
		}else {
			document.getElementById("idCheck").className = "";
			document.getElementById("issueButton").className = "";
			document.getElementById("mailCodeCheckButton").className = "";
		} 
	});
	
</script>

<script>
/* 메일 보내기 */
$(document).ready(function(e){
	
	var duplicateEmail = false; //이메일 유무 확인 값
	
	$('#issueButton').click(function(){
	    console.log('메일 펑션');
	    
	    //이메일 중복 검사
		$.ajax({
			url: "${pageContext.request.contextPath}/emailCheck",
			type: "GET",
			data:{
				"emailkCheckVal":$('#EMAIL_CHECK').val()
			},
			
			success: function(data) {
				if($.trim($('#EMAIL_CHECK').val()) == '' ){
					console.log('이메일이 입력되지 않음');
					$("#EMAIL").css("background-color", "#ffeded");
					$("#emailCheckLabelEmp").attr("style", "display:block");
					$("#emailCheckLabel").attr("style", "display:none");
					$("#emailCheckIcon").attr("style", "display:none");
					duplicateEmail = false;
				} else if(data != 0) {
					console.log('이메일 중복되거나 비어있을 경우' + data);
					$("#EMAIL").css("background-color", "#ffeded");
					$("#emailCheckLabelEmp").attr("style", "display:none");
					$("#emailCheckLabel").attr("style", "display:block");
					$("#emailCheckIcon").attr("style", "display:none");
					duplicateEmail = false;
				} else if(data == 0 && $.trim($('#EMAIL_CHECK').val()) != '' ) {
					console.log('이메일 중복이 없을 경우' + data);
					$("#EMAIL").css("background-color", "#eeffed");
					$("#emailCheckLabelEmp").attr("style", "display:none");
					$("#emailCheckLabel").attr("style", "display:none");
					$("#emailCheckIcon").attr("style", "display:block");
					duplicateEmail = true;
					alert('사용 가능한 이메일입니다.');
					emailCode(duplicateEmail);
					certifyTimer();
				}
			},
			error:function(request,status,error){
		        alert("먼저 올바른 이메일을 입력하고 인증번호를 발급받아 주십시오"); // 실패 시 처리
			}
	});//이메일 중복 검사
	    
	    

	
 	}); //issueButton 버튼 클릭시
	
	//이메일 인증번호 확인 (issueCheckButton)
	$("#mailCodeCheckButton").click(function() {
		$.ajax({
			type: 'POST',
			url: '/rudisfarm/buyer-join/emailcheckresult', 
			dataType: 'json',
			contentType: "application/json; charset=utf-8;",
			data: JSON.stringify({
						EMAIL: $('#EMAIL_CHECK').val(),
						CHECK_KEY: $('#mail_check_input').val()
					}), 
			success: function(data) {
				if(data.resultCode == 1) {
					console.log('인증 번호 같음');
					alert("인증되었습니다.");
					$("#mail_check_input").css("background-color", "#eeffed");
					$("#timer").css("display", "none");
				} else {
					console.log('인증 번호 다름');
					alert("인증에 실패했습니다. 다시 시도해주세요.");
					$("#mail_check_input").css("background-color", "#ffeded");
				}
			},
			error: function(e) {
				console.log("에러 발생!");
				console.log(e);
			}
		});
	}); // 인증번호 확인 버튼을 누를때
 });
 
  function emailCode(duplicateEmail) {
	    if(duplicateEmail == true){
	         $.ajax({
				type: 'POST',
		        url:"${pageContext.request.contextPath}/buyer-join/emailcheck",
	        	dataType: 'json',
				contentType: "application/json; charset=utf-8;",
				data: JSON.stringify({
							EMAIL: $('#EMAIL_CHECK').val(),
				}), 
					
					success: function(data) {
						
						if(data.resultCode == 1) {
							$('#mail_check_button').removeAttr("disabled");
							$('#EMAIL').val($('#EMAIL_CHECK').val());
							alert("입력한 이메일로 인증코드를 전송했습니다. 확인 후 인증코드를 입력해주세요.");
						} else {
							$('#mail_check_button').attr("disabled", "ture");
							$('#EMAIL').val($('#EMAIL_CHECK').val());
							alert("인증코드 전송에 실패했습니다. 다시 시도해주세요.");
						}
					},
					error: function(e) {
						console.log("에러 발생!");
						console.log(e);
				    },
	 			});
		    } else {
	/* 	    	alert('중복된 이메일입닏다.'); */
		    	
		    } // 이메일 전송
  }
  
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
				<div class="section section-bg-10 pt-11 pb-17" >
				
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<h2 class="page-title text-center">회원 가입</h2>
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
									<li><a href="join">회원 가입</a></li>
									<!-- <li>My Account</li> -->
								</ul>
							</div>
						</div>
					</div>
				</div>
				
				
				
				<!-- 회원가입 시작 -->
				<div class="section pt-1 pb-1" id="sectionPading">
					<div class="container">
						<div class="row">
							<div class="col-md-3 col-sm-1"></div>
								<div class="col-md-6 col-sm-9">
								<div class="commerce">
										<div class="row">
											<div style="text-align:right;font-size:90%">
												<br><a href="seller-join"><span>혹시 판매할 상품이 있다면 <br>이쪽에서 가입해주세요</span></a>
											</div>
										</div>
									<br>
									<h2 style="text-align:center;">회원가입</h2>
									<form action="join" method="post" id="joinForm">
										<br>
										<div class="row">
											<div class="col-md-12 col-sm-12">
												<label>아이디 <span class="required">*</span></label>
											</div>
											<div class="col-md-8 col-sm-9 col-xs-12" style="display:inline">
												<input type="text" placeholder="ID" id="USER_ID" name="USER_ID" value=""  required>
											</div>
											<div class="col-md-3 col-sm-3 col-xs-12" style="display:inline">
												<button id="idCheck" class="idCheck" type="button" style="display:inline;white-space:nowrap">&nbsp;&nbsp;&nbsp;&nbsp;중복 체크&nbsp;&nbsp;&nbsp;&nbsp;</button>
											</div>
										</div>
										
										
										
										<div>
											<label id="idCheckLabelEmp"  style="text-color:red; font-size:90%; display:none;">아이디가 입력되지 않았습니다.</label>
											<label id="idCheckLabel"  style="text-color:red; font-size:90%; display:none;">이미 가입된 아이디입니다.</label>
											<label id="idCheckIcon" style="color:#2db400;font-size:90%;display:none;"></label>
										</div>
										<div class="row">
											<div class="col-md-12">
												<label>비밀번호 <span class="required">*</span></label>
												<div class="form-wrap">
													<input type="password" placeholder="PASSWORD" id="PASSWORD" name="PASSWORD" value="" size="40" required>
												</div>
											</div>
										</div>
										
										<div class="row">
											<div class="col-md-12">
												<label>비밀번호 확인 <span class="required">*</span></label>
												<div class="form-wrap">
													<input type="password" placeholder="비밀번호를 다시 한번 입력해주세요." id="PASSWORD_CHECK" name="PASSWORD_CHECK" value="" size="40" required>
												</div>
											</div>
										</div>
										
										<div class="row">
											<div class="col-md-12">
												<label>이메일 <span class="required">*</span></label>
											</div>
											<div class="col-md-8 col-sm-9 col-xs-12" style="display:inline">
												<input type="email" placeholder="EMAIL" id="EMAIL_CHECK" name="EMAIL_CHECK" value="" size="30" required>
												<input type="hidden"id="EMAIL" name="EMAIL" value="" size="30" required>
											</div>
											<div class="col-md-3 col-sm-3 col-xs-12" style="display:inline">
												<button id="issueButton" class="mail_check_button" type="button" style="display:inline;white-space:nowrap">인증번호 발급</button>
											</div>
										</div>
										
										<div>
											<label id="emailCheckLabelEmp"  style="text-color:red; font-size:90%; display:none;!important;">이메일이 입력되지 않았습니다.</label>
											<label id="emailCheckLabel"  style="text-color:red; font-size:90%; display:none;!important;">이미 가입된 이메일입니다.</label>
											<label id="emailCheckIcon" style="color:#2db400;font-size:90%;display:none;"></label>
										</div>
										
										<div class="row">
											<div class="col-md-5 col-sm-5 col-xs-6">
												<label>이메일 인증번호 <span class="required">*</span></label>
											</div>
											<div id="timer" class="col-md-5 col-sm-5 col-xs-5"></div>
										<!-- </div>
										<div class="row"> -->
											<div class="col-md-8 col-sm-9 col-xs-12" >
												<input type="text" placeholder="MAILCODE" id="mail_check_input" name="mail_check_input" value="" size="40" required>
											</div>
											<div class="col-md-3 col-sm-3 col-xs-12" style="display:inline">
												<button id="mailCodeCheckButton" type="button" style="display:inline;white-space:nowrap">인증번호 확인</button>
											</div>
										</div>
										
										<div class="row">
											<div class="col-md-12">
												<label>이름 <span class="required">*</span></label>
												<div class="form-wrap">
													<input type="text" placeholder="NAME" id="USER_NAME" name="USER_NAME" value="" size="40" required>
												</div>
											</div>
										</div>
										
										<div class="row">
											<div class="col-md-12">
												<label>주소 <span class="required" style="display:inline;">*</span></label>
												<input type="button" class="btn btn-block" id="smallbutton" onclick="execDaumPostcode()" value="&nbsp;&nbsp;&nbsp;&nbsp;주소 검색&nbsp;&nbsp;&nbsp;&nbsp;" style="display:inline;">
												<div class="form-wrap">
													<input type="text" id="FIR_ADDRESS" name="FIR_ADDRESS" placeholder="ADDRESS" readonly  required>
												</div>
													<input type="text" id="SEC_ADDRESS" name="SEC_ADDRESS" placeholder="DETAILED ADDRESS" required>				
														<input type="hidden" class="inputMaterial" id="postcode" readonly disabled>
														<input type="hidden" class="inputMaterial" id="extraAddress" placeholder="참고항목" disabled>
											</div>
										</div>
										
										<div class="row">
											<div class="col-md-12">
												<label>연락처 <span class="required">*</span></label>
												<div class="form-wrap">
													<input type="text" placeholder="-없이 입력해주세요." id="PHONE" name="PHONE" value="" size="40" required>
												</div>
											</div>
										</div>
										
										<div class="row">
											<div class="col-md-12">
												<label>생년월일 <span class="required">*</span></label>
												<div class="form-wrap">
													<input type="DATE" placeholder="BIRTHDATE" id="BIRTHDATE" name="BIRTHDATE" value="2000-01-01" size="40" required>
												</div>
											</div>
										</div>
										
										<div class="row">
											<div class="col-md-12">
												<label>성별 <span class="required">*</span></label>
												<div class="form-wrap">
													<input type="radio" name="GENDER" value="0" checked="checked">비공개&nbsp; &nbsp;
													<input type="radio" name="GENDER" value="1" >남자&nbsp; &nbsp;
													<input type="radio" name="GENDER" value="2" >여자		 										
												</div>
											</div>
										</div>
										
										<!-- 캡차 -->
										<div>
											<table>
												<tr>
													<td colspan='2'>
														<label>아래 보이는대로 입력해주세요. <span class="required">*</span></label>
													</td>
												</tr>
												<tr>
													<td style="width:150px;margin:0;padding:5px;" >
														<div id="catpcha" >캡차를 불러오는 중입니다.</div>
														<div id="audiocatpch" style="display: none;width:150px;" ></div>
													</td>
													<td>
														<input class="form-control" type="text" id="answer" name="answer" value="" style="max-height:150%;max-width:100%;margin:0;"/>
													</td>
												</tr>
												<tr>
													<td colspan='2' style="padding:5px;">
														<!-- <div class="btn-group btn-group-sm"> -->
															<input id="reLoad" type="button" value="새로고침" />
															<input type="button" id="frmSubmit" value="확인" />
														<!-- </div> -->
													</td>
												</tr>
											</table>
										</div>
										<br>
										
										<!-- /캡차 -->
										
										<div class="row">
											<div class="col-md-12">
												<div class="form-wrap">
													<button type="button" class="btn btn-block" id="signUp" style="text-align:center;">회원가입</button>
												</div>
											</div>
										</div>
										<hr class="one">
										<div class="row">
											<div class="col-md-12" style="text-align:right;">
												<p>이미 아이디가 잊으신가요? |
													<a href="login"><span> 로그인 </span></a>
												<p>계정을 잊어버리셨다면 |
													<a href="find"><span> 아이디/비밀번호 찾기 </span></a>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 회원가입 끝 -->
				
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