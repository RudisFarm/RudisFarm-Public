<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <title>RudisFarm :: 판매자 회원 정보 수정</title>

    <jsp:include page="/resources/admin_bootstrap/commons/fontfaces_css.jsp"/>
    <jsp:include page="/resources/admin_bootstrap/commons/bootstrap_css.jsp"/>
    <jsp:include page="/resources/admin_bootstrap/commons/vendor_css.jsp"/>
    <jsp:include page="/resources/admin_bootstrap/commons/main_css.jsp"/>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#sellerModify").click(function() {
				$.ajax({
					type: 'PUT',
					url: 'seller-info', 
					dataType: 'json',
					contentType: "application/json; charset=utf-8;",
					data: JSON.stringify({
								USER_NAME: $('#USER_NAME').val(),
								COMPANY_NAME: $('#COMPANY_NAME').val(),
								FIR_ADDRESS: $('#FIR_ADDRESS').val(),
								SEC_ADDRESS: $('#SEC_ADDRESS').val(),
								PHONE: $('#PHONE').val()
							}), 
					success: function(data) {
						if(data.resultCode == 1) {
							location.href='seller-info';
						} else {
							alert("회원정보 수정에 실패했습니다.");
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
	                                <strong>판매자 비밀번호 수정</strong>
	                            </div>
	                            <div class="card-body card-block">
	                                <form id="sellerModifyForm" enctype="multipart/form-data" class="form-horizontal">
	                                	<div class="row form-group">
	                                        <div class="col col-md-3">
	                                            <label class=" form-control-label"><strong>아이디</strong></label>
	                                        </div>
	                                        <div class="col-12 col-md-9">
	                                            <p class="form-control-static">${resultUserVO.getUSER_ID()}</p>
	                                        </div>
	                                    </div>
	                                    <div class="row form-group">
	                                        <div class="col col-md-3">
	                                            <label class="form-control-label"><strong>이메일</strong></label>
	                                        </div>
	                                        <div class="col-12 col-md-9">
	                                        	<p class="form-control-static">${resultUserVO.getEMAIL()}</p>
	                                        </div>
	                                    </div>
	                                    <div class="row form-group">
	                                        <div class="col col-md-3">
	                                            <label class=" form-control-label"><strong>이름</strong></label>
	                                        </div>
	                                        <div class="col-12 col-md-9">
	                                            <input type="text" id="USER_NAME" name="USER_NAME" placeholder="이름" class="form-control" value="${resultUserVO.getUSER_NAME()}" required="required">
	                                        </div>
	                                    </div>
	                                    <div class="row form-group">
	                                        <div class="col col-md-3">
	                                            <label class=" form-control-label"><strong>업체명</strong></label>
	                                        </div>
	                                        <div class="col-12 col-md-9">
	                                            <input type="text" id="COMPANY_NAME" name="COMPANY_NAME" placeholder="업체명" class="form-control" value="${resultUserVO.getCOMPANY_NAME()}" required="required">
	                                        </div>
	                                    </div>
	                                    <div class="row form-group">
	                                        <div class="col col-md-3">
	                                            <label class=" form-control-label"><strong>주소</strong></label>
	                                        </div>
	                                        <div class="col-12 col-md-9">
	                                        	<input class="au-input au-input--full" type="text" id="postcode" placeholder="우편번호" disabled="disabled" required="required">
	                                            <input type="text" id="FIR_ADDRESS" name="FIR_ADDRESS" placeholder="주소" class="form-control" value="${resultUserVO.getFIR_ADDRESS()}" readonly="readonly" required="required">
	                                            <input type="text" id="SEC_ADDRESS" name="SEC_ADDRESS" placeholder="상세 주소" class="form-control" value="${resultUserVO.getSEC_ADDRESS()}" required="required">
	                                        	<input class="btn btn-primary m-b-20" type="button" onclick="execDaumPostcode()" value="주소 검색">
	                                        	<input type="hidden" id="extraAddress" placeholder="참고항목" disabled="">
	                                        </div>
	                                    </div>
	                                    <div class="row form-group">
	                                        <div class="col col-md-3">
	                                            <label class=" form-control-label"><strong>전화번호</strong></label>
	                                        </div>
	                                        <div class="col-12 col-md-9">
	                                            <input type="text" id="PHONE" name="PHONE" placeholder="전화번호" class="form-control" value="${resultUserVO.getPHONE()}" required="required">
	                                        </div>
	                                    </div>
	                                    <div class="row form-group">
	                                        <div class="col col-md-3">
	                                            <label class=" form-control-label"><strong>가입일자</strong></label>
	                                        </div>
	                                        <div class="col-12 col-md-9">
	                                            <p class="form-control-static">${resultUserVO.getJOINDATE()}</p>
	                                        </div>
	                                    </div>
	                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label class=" form-control-label"><strong>사업자 등록 번호</strong></label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                        	<p class="form-control-static">${resultUserVO.getSERIAL()}</p>
                                        </div>
                                    </div>
	                                    <div class="row form-group">
	                                        <div class="col col-md-3">
	                                            <label class=" form-control-label"><strong>계정 상태</strong></label>
	                                        </div>
	                                        <div class="col-12 col-md-9">
	                                            <p class="form-control-static">
                                            	<c:choose>
                                           		<c:when test="${resultUserVO.getSTATUS() eq 0}">
                                           			<span style="color: gray;"><strong>미승인</strong></span>
                                           			<small class="help-block form-text">판매 승인되지 않은 계정입니다.</small>
                                           		</c:when>
                                           		<c:when test="${resultUserVO.getSTATUS() eq 1}">
                                           			<span style="color: green;"><strong>승인</strong></span>
                                           			<small class="help-block form-text">판매 승인된 계정입니다.</small>
                                           		</c:when>
                                           		<c:when test="${resultUserVO.getSTATUS() eq 2}">
                                           			<span style="color: red;"><strong>정지</strong></span>
                                           			<small class="help-block form-text">운영 정책을 위반하여 판매 정지된 계정입니다. 세부사항은 관리자에게 문의하세요.</small>
                                           		</c:when>
                                           		<c:when test="${resultUserVO.getSTATUS() eq 3}">
                                           			<span style="color: orange;"><strong>재승인</strong></span>
                                           			<small class="help-block form-text">사업자 인증 번호를 변경하여 재승인이 필요한 계정입니다. 세부사항은 관리자에게 문의하세요.</small>
                                           		</c:when>
                                           		<c:when test="${resultUserVO.getSTATUS() eq 4}">
	                                   				<span style="color: orangered;"><strong>재승인 거부</strong></span>
	                                    			<small class="help-block form-text">재승인 요청이 관리자에 의해 거부된 계정입니다. 다시 재승인 신청하세요. 세부사항은 관리자에게 문의하세요.</small>
	                                    		</c:when>
                                            	</c:choose>
	                                            </p>
	                                        </div>
	                                    </div>
	                                </form>
	                            </div>
	                            <div class="card-footer">
	                                <button type="button" class="btn btn-primary btn-sm" id="sellerModify">
	                                    <i class="fa fa-dot-circle-o"></i> 수정
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
    
    <script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/seller-js/address-api.js?v=<%=System.currentTimeMillis()%>"></script>
</body>
</html>