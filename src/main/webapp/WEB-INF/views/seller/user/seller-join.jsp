<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="au theme template">
	    <meta name="author" content="Hau Nguyen">
	    <meta name="keywords" content="au theme template">
	    <jsp:include page="/resources/admin_bootstrap/commons/fontfaces_css.jsp"/>
	    <jsp:include page="/resources/admin_bootstrap/commons/bootstrap_css.jsp"/>
	    <jsp:include page="/resources/admin_bootstrap/commons/vendor_css.jsp"/>
	    <jsp:include page="/resources/admin_bootstrap/commons/main_css.jsp"/>
	    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	    <script type="text/javascript">
	    	var x;
	    	
		    function certifyTimer(){
				var time = 59;
				var sec ="";
				
				clearInterval(x);
				
				x = setInterval(function() {
					sec = time%60;
					$("#timer").css("color", "red");
		
					document.getElementById("timer").innerHTML = "남은시간 : "+ sec + "초";
					time--;
		
					//타임아웃시
					if(time<0) {
						clearInterval(x);
						document.getElementById("timer").innerHTML = "시간 초과";
						}
				}, 1000);
		
			} //타이머
			
			function clearTimer() {
				clearInterval(x);
			}
	    
	    	$(function() {
	    		$('#EMAIL_CHECK').on("propertychange change keyup paste input", function() {
	    			if($('#EMAIL').val() != $('#EMAIL_CHECK').val() || $('#EMAIL_CHECK').val() == '') {
	    				$('#emailValidation').addClass("disabled");
	    				$('#emailValidation').attr('disabled', true);
	    			} else if($('#EMAIL').val() != $('#EMAIL_CHECK').val()) {
	    				$('#emailValidation').removeClass("disabled");
	    				$('#emailValidation').attr('disabled', false);
	    			}
	    		});
	    		
	    		$('#emailCheckBtn').click(function() {
	    			//이메일 유효성 검사
	    			var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	        		if(!getMail.test($("#EMAIL_CHECK").val())) {
	        			alert("이메일 형식에 맞게 입력해주세요.")
	        			$("#EMAIL_CHECK").val("");
	        			$("#EMAIL_CHECK").focus();
	        			return false;
	        		}
	    			
	    			$.ajax({
    					type: 'POST',
    					url: '/rudisfarm/seller-join/emailcheck', 
    					dataType: 'json',
    					contentType: "application/json; charset=utf-8;",
    					data: JSON.stringify({
    								EMAIL: $('#EMAIL_CHECK').val()
    							}), 
    					success: function(data) {
    						if(data.resultCode == 1) {
    		    				$('#EMAIL').val($('#EMAIL_CHECK').val());
    		    				certifyTimer();
    							alert("입력한 이메일로 인증코드를 전송했습니다. 확인 후 인증코드를 입력해주세요.");
    							$('#emailValidation').removeClass("disabled");
    							$('#emailValidation').attr('disabled', false);
    						} else if(data.resultCode == 0) {
    							alert("이미 사용중인 이메일입니다.");
    							$('#emailValidation').attr('disabled', true);
    						} else if(data.resultCode == 2) {
    							alert("이미 인증코드가 전송됐습니다.");
    						} else {
    							alert("인증코드 전송에 실패했습니다. 잠시후 다시 시도해주세요.");
    							$('#emailValidation').attr('disabled', true);
    						}
    					},
    					error: function(e) {
    						console.log("에러 발생!");
    						console.log(e);
    					}
    				});
	    		});
	    		
	    		$("#emailValidation").click(function() {
	    			$.ajax({
						type: 'POST',
						url: '/rudisfarm/seller-join/emailcheckresult', 
						dataType: 'json',
						contentType: "application/json; charset=utf-8;",
						data: JSON.stringify({
									EMAIL: $('#EMAIL_CHECK').val(),
									CHECK_KEY: $('#EMAIL_VALIDATION').val()
								}), 
						success: function(data) {
							if(data.resultCode == 1) {
								$('#emailValidation').addClass("disabled");
								clearTimer();
								alert("인증되었습니다.");
								document.getElementById("timer").innerHTML = "";
								$('#EMAIL').val($('#EMAIL_CHECK').val());
								$('#emailValidation').addClass("disabled");
								$('#emailValidation').attr('disabled', true);
							} else {
								$('#emailValidation').removeClass("disabled");
								alert("인증에 실패했습니다. 다시 시도해주세요.");
							}
						},
						error: function(e) {
							console.log("에러 발생!");
							console.log(e);
						}
					});
	    		});
	    		
	    	});
	    </script>
	    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	    <script type="text/javascript">
	    	
	    </script>
	    
	    
	    <title>RudisFarm :: 판매자 회원가입</title>
	</head>
	<body class="animsition">
	    <div class="page-wrapper">
	        <div class="container">
	            <div class="login-wrap">
	                <div class="login-content">
	                    <div class="login-logo">
	                    	<h1>RudisFarm</h1>
	                    </div>
	                    <div class="login-form">
	                        <form enctype="multipart/form-data" id="joinForm">
	                        	<h2 class="title-7 m-b-35 text-center">판매자 회원 가입</h2>
	                            <div class="form-group">
	                                <label>아이디</label>
									<input class="au-input au-input--full" type="text" name="USER_ID" id="USER_ID" placeholder="아이디">
									<button id="idCheck" class="btn btn-primary m-b-20 btn-block" id="idCheck" type="button">중복 확인</button>
	                            </div>
	                            <div class="form-group">
	                                <label>이메일</label>
	                                <input class="au-input au-input--full" type="email" name="EMAIL_CHECK" id="EMAIL_CHECK" placeholder="이메일">
	                                <input class="au-input au-input--full" type="hidden" name="EMAIL" id="EMAIL">
	                                <button class="btn btn-primary m-b-20 btn-block" type="button" id="emailCheckBtn">인증번호 전송</button>
	                                <div id="timer"></div>
	                                <input class="au-input au-input--full" type="email" name="EMAIL_VALIDATION" id="EMAIL_VALIDATION" placeholder="인증번호">
	                                <button class="btn btn-primary m-b-20 btn-block disabled" type="button" id="emailValidation" disabled="disabled">인증 확인</button>
	                            </div>
	                            <div class="form-group">
	                                <label>비밀번호</label>
	                                <input class="au-input au-input--full" type="password" name="PASSWORD" id="PASSWORD" placeholder="비밀번호">
	                            </div>
	                            <div class="form-group">
	                                <label>비밀번호 확인</label>
	                                <input class="au-input au-input--full" type="password" name="PASSWORD_CONFIRM" id="PASSWORD_CONFIRM" placeholder="비밀번호 확인">
	                            </div>
	                            <div class="form-group">
	                                <label>이름</label>
	                                <input class="au-input au-input--full" type="text" name="USER_NAME" id="USER_NAME" placeholder="이름">
	                            </div>
	                            <div class="form-group">
	                                <label>업체 이름</label>
	                                <input class="au-input au-input--full" type="text" name="COMPANY_NAME" id="COMPANY_NAME" placeholder="업체 이름">
	                            </div>
	                            <div class="form-group">
	                                <label>주소</label>
	                                <input class="au-input au-input--full" type="text" id="postcode" placeholder="우편번호" disabled required>
									<input class="au-input au-input--full" type="text" name="FIR_ADDRESS" id="FIR_ADDRESS" placeholder="주소" readonly required><br>
									<input class="au-input au-input--full" type="text" name="SEC_ADDRESS" id="SEC_ADDRESS" placeholder="상세 주소" required>
									<input class="btn btn-primary m-b-20 btn-block" type="button" onclick="execDaumPostcode()" value="주소 검색">
									<input type="hidden" id="extraAddress" placeholder="참고항목" disabled>
	                            </div>
	                            <div class="form-group">
	                                <label>전화번호</label>
	                                <input class="au-input au-input--full" type="text" name="PHONE" id="PHONE" placeholder="전화번호">
	                            </div>
	                            <div class="form-group">
	                                <label>사업자 등록 번호</label>
	                                <input class="au-input au-input--full" type="text" name="SERIAL" id="SERIAL" placeholder="사업자 등록 번호 (XXX-XX-XXXXX)">
	                            </div>
	                            <div class="form-group">
                                	<label>사업자 등록 번호 증빙 자료</label>
                                	<div id="serial-holder"></div>
                               		<input type="file" name="serial-image" id="serial-image"/>
	                            </div>
	                            <hr>
	                            <h2 class="title-7 m-b-35 text-center">상품 정보</h2>
	                            <div class="form-group">
	                                <label>상품 제목</label>
	                                <input class="au-input au-input--full" type="text" name="PRODUCT_NAME" id="PRODUCT_NAME" placeholder="상품 제목">
	                            </div>
	                            <div class="form-group">
	                                <label>가격</label>
	                                <input type="text" id="PRICE" name="PRICE" placeholder="가격..." class="form-control" onkeyup="inputNumberFormat(this)">
	                            </div>
	                            <div class="form-group">
	                                <label>무게</label>
	                                <input type="text" name="WEIGHT" id="WEIGHT" placeholder="판매 단위..." class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
	                            </div>
	                            <div class="form-group">
	                                <label>수량</label>
	                                <input type="text" name="COUNT" id="COUNT" placeholder="수량..." class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
	                            </div>
	                            <div class="form-group">
	                                <label>상품 설명</label>
	                                <textarea name="DESCRIPTION" id="DESCRIPTION" rows="9" placeholder="상품 설명 (1500자)..." maxlength="1500" class="form-control"></textarea>
<!-- 	                                <input class="au-input au-input--full" type="text" name="DESCRIPTION" id="DESCRIPTION" placeholder="상품 설명 (1500자)..." maxlength="1500"> -->
	                            </div>
	                            <div class="form-group">
	                            	<label>카테고리 분류</label>
	                                <div class="rs-select2--dark rs-select2--md m-r-10 rs-select2--border">
	                                	<select class="js-select2" id="TYPE1">
	                                    	<option selected="selected">--------</option>
	                                    </select>
	                                    <div class="dropDownSelect2"></div>
                                	</div>
	                               
	                                <input type="hidden" name="TYPE1">
	                                   
	                                <div class="rs-select2--dark rs-select2--sm rs-select2--border">
	                                    <select class="js-select2" id="TYPE2">
	                                        <option selected="selected">----</option>
	                                    </select>
	                                    <div class="dropDownSelect2"></div>
	                                </div>
	                                <input type="hidden" name="TYPE2">
	                                <input type="hidden" name="PRICE_PER_GRAM" id="PRICE_PER_GRAM">
	                                <br>
	                                <br>
	                                <div class="form-group">
	                                	<label>대표 이미지</label>
	                                	<div id="thum-holder"></div>
                                   		<input type="file" name="thum-image" id="thum-image"/>
                                   	</div>
                                   	<div class="form-group">
	                                   	<label>상세보기 이미지</label>
	                                   	<div id="desc-holder"></div>
                        				<input type="file" name="desc-image" id="desc-image" multiple/>
                        			</div>
                        			<p id="status">File API &amp; FileReader API not supported</p>
	                            </div>
	                            <button class="au-btn au-btn--block au-btn--green m-b-20" type="button" id="sellerJoin">회원 가입</button>
	                        </form>
	                        <div class="register-link">
	                            <p>이미 계정이 있으신가요? <a href="login">로그인</a></p>
	                            <a href="/rudisfarm">메인 화면으로</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	    	</div>
	    </div>
	    
	    <script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/product-type.js?v=<%=System.currentTimeMillis()%>"></script>	
	    <script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/seller-js/address-api.js?v=<%=System.currentTimeMillis()%>"></script>	
	    <script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/seller-js/input-image-up.js?v=<%=System.currentTimeMillis()%>"></script>	
	    <script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/seller-js/sellerJoin-form.js?v=<%=System.currentTimeMillis()%>"></script>	
		<jsp:include page="/resources/admin_bootstrap/commons/js.jsp"/>
	</body>	
</html>