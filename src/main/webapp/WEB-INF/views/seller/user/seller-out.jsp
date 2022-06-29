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
			$('#PASSWORD').on('keyup', function() {
    			if($(this).val() != "") {
    				$('#PASSWORD').removeClass("is-invalid");
					$('#PASSWORD').addClass("is-valid");
    			} else {
    				$('#PASSWORD').removeClass("is-valid");
    			}
			});
			
			$("#sellerOutPasswordCheck").click(function() {
				if(!$('#agree').is(":checked")) {
					alert("약관에 먼저 동의해주세요.");
					return;
				}
				
				var OutCheck = confirm("정말로 판매자 회원 탈퇴하시겠습니까?\n탈퇴 완료시 취소할 수 없습니다.");
				
				if(OutCheck) {
					$.ajax({
						type: 'DELETE',
						url: 'seller-info', 
						dataType: 'json',
						contentType: "application/json; charset=utf-8;",
						data: JSON.stringify({
									PASSWORD: $('#PASSWORD').val()
								}), 
						success: function(data) {
							if(data.resultCode == 1) {
								$('#PASSWORD').removeClass("is-invalid");
								$('#PASSWORD').addClass("is-valid");
								$('#passwordCheckMsg').html("");
								alert("판매자 탈퇴가 완료되었습니다. \n로그인 화면으로 이동합니다.");
								$('#seller-logout').submit();
							} else {
								$('#PASSWORD').removeClass("is-valid");
								$('#PASSWORD').addClass("is-invalid");
								$('#passwordCheckMsg').html("비밀번호가 일치하지 않습니다.");
							}
						},
						error: function(e) {
							console.log("에러 발생!");
							console.log(e);
						}
					});
				}
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
	                                <strong>판매자 회원 탈퇴</strong>
	                            </div>
	                            <div class="card-body card-block">
	                            	<div class="jumbotron">
	                            		<h1 class="pb-2 display-5 text-center">판매자 회원 탈퇴 안내</h1>
	                            		<div class="vue-lists">
					                      <div class="row">
					                        <div class="col-md-6">
					                          <h3 class="text-center">개인 정보 처리 방안</h3>
					                          <ul>
					                            <li>
					                            	판매자 탈퇴시 판매자 전용 웹 서비스는 더이상 이용하실 수 없습니다.
					                            </li>
					                            <li>판매자는 판매자 개인 정보와 판매 상품의 등록 및 게시, 판매 내용과 결제 내역같은 거래정보 열람이 제한되며, 해당 거래명세는 전자상거래 소비자 보호 법률에 따라 만료기간까지 보관 후 자동 폐기됩니다.</li>
					                            <li>
					                              일정 기간 보관되는 정보들은 다음과 같습니다.
					                              <ul class="vue-list-inner">
					                                <li>아이디, 이메일, 이름, 사업자등록번호와 같은 개인정보 전체.</li>
					                                <li>판매 물품 목록 전체.</li>
					                                <li>거래된 물품의 결제 내역 전체.</li>
					                              </ul>
					                            </li>
					                          </ul>
					                        </div>
					                        <div class="col-md-6 text-left">
					                          <div>
					                            <h3 class="text-center">유의사항</h3>
					                            <ol class="vue-ordered">
					                              <li>
					                                전자상거래 소비자 보호 법률에 따른 개인정보 자동 폐기 이전까지 아래의 행위는 제한됩니다.
					                                <ul class="vue-list-inner">
					                                  <li>동일 아이디, 동일 이메일을 사용한 재가입.
					                                  </li>
					                                  <li>등록된 상품 정보의 열람 및 수정, 삭제 요구.</li>
					                                  <li>결제 기록의 열람 및 수정, 삭제 요구.</li>
					                                </ul>
					                              </li>
					                            </ol>
					                          </div>
					                        </div>
					                      </div>
					                    </div>
					                    <div class="vue-lists mt-3">
					                    	<div class="row">
							                    <div class="form-check">
		                                           <div class="checkbox">
		                                               <label for="agree" class="form-check-label ">
		                                                   <input type="checkbox" id="agree" name="agree" value="agree" class="form-check-input">명시된 루디스팜 판매자 탈퇴 약관을 확인하였으며 이에 동의합니다.
		                                               </label>
		                                           </div>
		                                       </div>
	                                       </div>
                                       </div>
	                            	</div>
	                                <form id="sellerOutForm" class="form-horizontal">
	                                    <div class="row form-group">
	                                        <div class="col col-md-3">
	                                            <label class=" form-control-label"><strong>비밀번호</strong></label>
	                                        </div>
	                                        <div class="col-12 col-md-9">
	                                            <input type="password" id="PASSWORD" name="PASSWORD" placeholder="비밀번호" class="form-control" value="${resultUserVO.getNAME()}">
	                                        	<small class="help-block form-text" id="passwordCheckMsg"></small>
	                                        </div>
	                                    </div>
	                                </form>
	                            </div>
	                            <div class="card-footer">
	                                <button type="button" class="btn btn-danger btn-sm" id="sellerOutPasswordCheck">
	                                    <i class="fa fa-dot-circle-o"></i> 탈퇴
	                                </button>
	                                <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='seller-info'">
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