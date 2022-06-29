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
	    	$(function() {
	    		
	    		$('#EMAIL_CHECK').on("propertychange change keyup paste input", function() {
	    			if($('#EMAIL').val() != $('#EMAIL_CHECK').val() || $('#EMAIL_CHECK').val() == '') {
	    				$('#emailValidation').addClass("disabled");
	    			}
	    		});
	    		
	    		$('#emailCheckBtn').click(function() {
	    			console.log("클릭");
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
    		    				$('#emailValidation').removeClass("disabled");
    		    				$('#EMAIL').val($('#EMAIL_CHECK').val());
    							alert("입력한 이메일로 인증코드를 전송했습니다. 확인 후 인증코드를 입력해주세요.");
    						} else {
    							$('#emailValidation').addClass("disabled");
    							alert("인증코드 전송에 실패했습니다. 다시 시도해주세요.");
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
								alert("인증되었습니다.");
								$('#EMAIL').val($('#EMAIL_CHECK').val());
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
	    
	    
	    <title>RudisFarm :: 판매자 회원가입</title>
	</head>
	<body class="animsition">
	    <div class="page-wrapper">
	        <div class="container">
	            <div class="login-wrap">
	                <div class="login-content">
	                    <div class="login-logo">
	                        <a href="#">
	                            <img src="<%= request.getContextPath() %>/resources/admin_bootstrap/images/icon/logo.png" alt="RudisFarm">
	                        </a>
	                    </div>
	                    <div class="login-form">
	                        <form method="post" enctype="multipart/form-data" id="joinForm">
	                        	<h2 class="title-7 m-b-35 text-center">판매자 회원 정보</h2>
	                            <div class="form-group">
	                                <label>아이디</label>
	                                <input class="au-input au-input--full" type="text" name="USER_ID" id="USER_ID" placeholder="아이디">
	                            </div>
	                            <div class="form-group">
	                                <label>이메일</label>
	                                <input class="au-input au-input--full" type="email" name="EMAIL_CHECK" id="EMAIL_CHECK" placeholder="이메일">
	                                <input class="au-input au-input--full" type="hidden" name="EMAIL" id="EMAIL">
	                                <button class="btn btn-primary m-b-20" type="button" id="emailCheckBtn">이메일 인증</button>
	                                <input class="au-input au-input--full" type="email" name="EMAIL_VALIDATION" id="EMAIL_VALIDATION" placeholder="인증번호">
	                                <button class="btn btn-primary m-b-20 disabled" type="button" id="emailValidation">확인</button>
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
	                                <label>업체 이름</label>
	                                <input class="au-input au-input--full" type="text" name="NAME" id="NAME" placeholder="업체 이름">
	                            </div>
	                            <div class="form-group">
	                                <label>주소</label>
	                                <input class="au-input au-input--full" type="text" id="postcode" placeholder="우편번호" disabled required>
									<input class="au-input au-input--full" type="text" name="FIR_ADDRESS" id="FIR_ADDRESS" placeholder="주소" readonly required><br>
									<input class="au-input au-input--full" type="text" name="SEC_ADDRESS" id="SEC_ADDRESS" placeholder="상세 주소" required>
									<input class="btn btn-primary m-b-20" type="button" onclick="execDaumPostcode()" value="주소 검색">
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
                        			<p id="status">File API &amp; FileReader API not supported</p>
	                            </div>
	                            <hr>
	                            <!------------ 상품 정보 폼이 들어갈 위치 ------------>
	                            <h2 class="title-7 m-b-35 text-center">상품 정보</h2>
	                            <div class="form-group">
	                                <label>상품 제목</label>
	                                <input class="au-input au-input--full" type="text" name="name" id="name" placeholder="상품 제목">
	                            </div>
	                            <div class="form-group">
	                                <label>가격</label>
	                                <input class="au-input au-input--full" type="number" id="PRICE" name="PRICE" placeholder="가격">
	                            </div>
	                            <div class="form-group">
	                                <label>무게</label>
	                                <input class="au-input au-input--full" type="number" name="WEIGHT" id="WEIGHT" placeholder="무게">
	                            </div>
	                            <div class="form-group">
	                                <label>수량</label>
	                                <input class="au-input au-input--full" type="number" name="COUNT" id="COUNT" placeholder="수량">
	                            </div>
	                            <div class="form-group">
	                                <label>상품 설명</label>
	                                <input class="au-input au-input--full" type="text" name="DESCRIPTION" id="DESCRIPTION" placeholder="상품 설명">
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
	                            <div class="login-checkbox">
	                                <label>
	                                    <input type="checkbox" name="aggree">이용 약관 및 개인정보 보관에 대해 동의합니다.
	                                </label>
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