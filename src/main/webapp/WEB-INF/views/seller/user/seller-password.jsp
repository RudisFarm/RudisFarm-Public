<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">

    <!-- Title Page-->
    <title>Dashboard</title>

    <jsp:include page="/resources/admin_bootstrap/commons/fontfaces_css.jsp"/>
    <jsp:include page="/resources/admin_bootstrap/commons/bootstrap_css.jsp"/>
    <jsp:include page="/resources/admin_bootstrap/commons/vendor_css.jsp"/>
    <jsp:include page="/resources/admin_bootstrap/commons/main_css.jsp"/>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
    	$(function() {
    		$('#CURRENT_PASSWORD').on('propertychange change keyup paste input', function() {
    			if($(this).val() != "") {
    				$('#CURRENT_PASSWORD').addClass("is-valid");
    				$('#CURRENT_PASSWORD').removeClass("is-invalid");
    				console.log("값 입력");
    				if($(this).val() == $('#NEW_PASSWORD').val()) {
    					console.log("중복");
        				$('#NEW_PASSWORD').addClass("is-invalid");
        				$('#CURRENT_PASSWORD').addClass("is-invalid");
        				$('#NEW_PASSWORD').removeClass("is-valid");
        				$('#CURRENT_PASSWORD').removeClass("is-valid");
        				$('#newPasswordCheckMsg').html("기존 비밀번호와 동일합니다.");
        			} else {
        				if($('#NEW_PASSWORD').val() != "") {
        					$('#NEW_PASSWORD').addClass("is-valid");
            				$('#CURRENT_PASSWORD').addClass("is-valid");
            				$('#NEW_PASSWORD').removeClass("is-invalid");
            				$('#CURRENT_PASSWORD').removeClass("is-invalid");
            				$('#newPasswordCheckMsg').html("사용 가능한 비밀번호입니다.");
        				}
        			}
    			} else {
    				$('#CURRENT_PASSWORD').addClass("is-invalid");
    				$('#CURRENT_PASSWORD').removeClass("is-valid");
    			}
    		});
    		
    		$('#NEW_PASSWORD').on('propertychange change keyup paste input', function() {
    			if($(this).val() != $('#CURRENT_PASSWORD').val()) {
    				if($(this).val() == "") {
        				$('#NEW_PASSWORD').addClass("is-invalid");
        				$('#NEW_PASSWORD').removeClass("is-valid");
        			} else {
        				$('#NEW_PASSWORD').addClass("is-valid");
        				$('#NEW_PASSWORD').removeClass("is-invalid");
        				$('#newPasswordCheckMsg').html("사용 가능한 비밀번호입니다.");
        			}
    			} else {
    				$('#NEW_PASSWORD').addClass("is-invalid");
    				$('#NEW_PASSWORD').removeClass("is-valid");
    				$('#newPasswordCheckMsg').html("기존 비밀번호와 동일합니다.");
    			}
				
				if($(this).val() == $('#NEW_PASSWORD_CHECK').val()) {
    				$('#NEW_PASSWORD_CHECK').addClass("is-valid");
    				$('#NEW_PASSWORD_CHECK').removeClass("is-invalid");
    				$('#newCheckPasswordCheckMsg').html("");
    			} else {
    				$('#NEW_PASSWORD_CHECK').addClass("is-invalid");
    				$('#NEW_PASSWORD_CHECK').removeClass("is-valid");
    				$('#newCheckPasswordCheckMsg').html("비밀번호가 일치하지 않습니다.");
    			}
    			
    		});
    		
    		$('#NEW_PASSWORD_CHECK').on('propertychange change keyup paste input', function() {
    			if($(this).val() == $('#NEW_PASSWORD').val()) {
    				$('#NEW_PASSWORD_CHECK').addClass("is-valid");
    				$('#NEW_PASSWORD_CHECK').removeClass("is-invalid");
    				$('#newCheckPasswordCheckMsg').html("");
    			} else {
    				$('#NEW_PASSWORD_CHECK').addClass("is-invalid");
    				$('#NEW_PASSWORD_CHECK').removeClass("is-valid");
    				$('#newCheckPasswordCheckMsg').html("비밀번호가 일치하지 않습니다.");
    			}
    		});
    		
			$("#sellerPasswordModify").click(function() {
    			
    			if($('#CURRENT_PASSWORD').val() == '') {
    				$('#CURRENT_PASSWORD').addClass("is-invalid");
    			}
    			if($('#NEW_PASSWORD').val() == '') {
    				$('#NEW_PASSWORD').addClass("is-invalid");
    			}
    			if($('#NEW_PASSWORD_CHECK').val() == '') {
    				$('#NEW_PASSWORD_CHECK').addClass("is-invalid");
    			}
    			
				$.ajax({
					type: 'PUT',
					url: 'seller-password', 
					dataType: 'json',
					contentType: "application/json; charset=utf-8;",
					data: JSON.stringify({
								CURRENT_PASSWORD: $('#CURRENT_PASSWORD').val(),
								NEW_PASSWORD: $('#NEW_PASSWORD').val(),
								NEW_PASSWORD_CHECK: $('#NEW_PASSWORD_CHECK').val()
							}), 
					success: function(data) {
						
						if(data.resultCode == 1) {
							$('#currentPasswordCheckMsg').html("");
							alert('비밀번호가 수정되었습니다.');
							location.href='seller-info';
						} else if(data.resultCode == 0) {
							$('#CURRENT_PASSWORD').addClass("is-invalid");
							$('#currentPasswordCheckMsg').html("기존 비밀번호가 일치하지 않습니다.");
						} else {
							$('#NEW_PASSWORD_CHECK').addClass("is-invalid");
							$('#newCheckPasswordCheckMsg').html("비밀번호가 일치하지 않습니다.");
							console.log("불일치로 인해 수정 거부됨");
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

</head>

<body class="animsition">
    <div class="page-wrapper">
        <!-- HEADER MOBILE-->
        <jsp:include page="/resources/admin_bootstrap/commons/seller_header_mobile.jsp"/>
        <!-- END HEADER MOBILE-->

        <!-- MENU SIDEBAR-->
        <jsp:include page="/resources/admin_bootstrap/commons/seller_sidebar.jsp"/>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <jsp:include page="/resources/admin_bootstrap/commons/seller_header_desktop.jsp"/>
            <!-- HEADER DESKTOP-->

            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                 		<div class="col-lg-12">
	                        <div class="card">
	                            <div class="card-header">
	                                <strong>판매자 회원 비밀번호 수정</strong>
	                            </div>
	                            <div class="card-body card-block">
	                                <form id="sellerPasswordModifyForm" class="form-horizontal">
	                                    <div class="row form-group">
	                                        <div class="col col-md-3">
	                                            <label class=" form-control-label"><strong>현재 비밀번호</strong></label>
	                                        </div>
	                                        <div class="col-12 col-md-9">
	                                            <input type="password" id="CURRENT_PASSWORD" name="CURRENT_PASSWORD" placeholder="현재 비밀번호" class="form-control" value="${resultUserVO.getNAME()}">
	                                        	<small class="help-block form-text" id="currentPasswordCheckMsg"></small>
	                                        </div>
	                                    </div>
	                                    <div class="row form-group">
	                                        <div class="col col-md-3">
	                                            <label class=" form-control-label"><strong>신규 비밀번호</strong></label>
	                                        </div>
	                                        <div class="col-12 col-md-9">
	                                            <input type="password" id="NEW_PASSWORD" name="NEW_PASSWORD" placeholder="신규 비밀번호" class="form-control" value="${resultUserVO.getNAME()}">
	                                        	<small class="help-block form-text" id="newPasswordCheckMsg"></small>
	                                        </div>
	                                    </div>
	                                    <div class="row form-group">
	                                        <div class="col col-md-3">
	                                            <label class=" form-control-label"><strong>신규 비밀번호 확인</strong></label>
	                                        </div>
	                                        <div class="col-12 col-md-9">
	                                            <input type="password" id="NEW_PASSWORD_CHECK" name="NEW_PASSWORD_CHECK" placeholder="신규 비밀번호 확인" class="form-control" value="${resultUserVO.getNAME()}">
	                                        	<small class="help-block form-text" id="newCheckPasswordCheckMsg"></small>
	                                        </div>
	                                    </div>
	                                </form>
	                            </div>
	                            <div class="card-footer">
	                                <button type="button" class="btn btn-primary btn-sm" id="sellerPasswordModify">
	                                    <i class="fa fa-dot-circle-o"></i> 수정
	                                </button>
	                                <button type="button" class="btn btn-danger btn-sm" onclick="location.href='seller-info'">
	                                    <i class="fa fa-ban"></i> 취소
	                                </button>
	                            </div>
	                        </div>
	                    </div>
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT-->
            
            <!-- END PAGE CONTAINER-->
        </div>

    </div>

    <!-- Jquery JS-->
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/slick/slick.min.js">
    </script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/wow/wow.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/animsition/animsition.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/circle-progress/circle-progress.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/select2/select2.min.js">
    </script>

    <!-- Main JS-->
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/js/main.js"></script>

</body>
</html>