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
								location.href='/rudisfarm/login';
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
					                              A wide variety of hypotheses have been proposed to account for the evolution of the striking stripes of zebras.
					                            </li>
					                            <li>The more traditional of these (1 and 2, below) relate to camouflage.</li>
					                            <li>The vertical striping may help the zebra hide in the grass by disrupting its outline.</li>
					                            <li>
					                              In addition, even at moderate distances, the striking striping merges to an apparent grey.
					                              <ul class="vue-list-inner">
					                                <li>However, the camouflage has been contested with arguments that most of a zebra's predator.</li>
					                                <li>Such as lions and hyenas cannot see well at a distance.</li>
					                                <li>More likely to have smelled or heard a zebra.</li>
					                              </ul>
					                            </li>
					                            <li>Before seeing it from a distance, especially at night.</li>
					                          </ul>
					                        </div>
					                        <div class="col-md-6 text-left">
					                          <div>
					                            <h3 class="text-center">유의사항</h3>
					                            <ol class="vue-ordered">
					                              <li>
					                                A wide variety of hypotheses have been proposed to account for the evolution of the striking stripes of zebras.
					                              </li>
					                              <li>The more traditional of these (1 and 2, below) relate to camouflage.</li>
					                              <li>The vertical striping may help the zebra hide in the grass by disrupting its outline.</li>
					                              <li>
					                                In addition, even at moderate distances, the striking striping merges to an apparent grey.
					                                <ul class="vue-list-inner">
					                                  <li>However, the camouflage has been contested with arguments that most of a zebra's predator.
					                                  </li>
					                                  <li>Such as lions and hyenas cannot see well at a distance.</li>
					                                  <li>More likely to have smelled or heard a zebra.</li>
					                                </ul>
					                              </li>
					                              <li>Before seeing it from a distance, especially at night.</li>
					                            </ol>
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