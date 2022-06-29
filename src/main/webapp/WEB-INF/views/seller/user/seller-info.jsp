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
    <title>RudisFarm :: 판매자 회원 정보</title>

    <jsp:include page="/resources/admin_bootstrap/commons/fontfaces_css.jsp"/>
    <jsp:include page="/resources/admin_bootstrap/commons/bootstrap_css.jsp"/>
    <jsp:include page="/resources/admin_bootstrap/commons/vendor_css.jsp"/>
    <jsp:include page="/resources/admin_bootstrap/commons/main_css.jsp"/>
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
	                                <strong>판매자 회원 정보</strong>
	                            </div>
	                            <div class="card-body card-block">
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
                                            <label class=" form-control-label"><strong>비밀번호</strong></label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                        	<button type="button" class="btn btn-link btn-sm" onclick="location.href='seller-password'">
                                           		<i class="fa fa-link"></i>&nbsp; 비밀번호 변경하기
                                            </button>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label class=" form-control-label"><strong>이메일</strong></label>
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
                                            <p class="form-control-static">${resultUserVO.getUSER_NAME()}</p>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label class=" form-control-label"><strong>업체명</strong></label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">${resultUserVO.getCOMPANY_NAME()}</p>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label class=" form-control-label"><strong>주소</strong></label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">${resultUserVO.getFIR_ADDRESS()}</p>
                                            <p class="form-control-static">${resultUserVO.getSEC_ADDRESS()}</p>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label class=" form-control-label"><strong>전화번호</strong></label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">${resultUserVO.getPHONE()}</p>
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
                                        	<p class="form-control-static">
	                                        	${resultUserVO.getSERIAL()}&nbsp;
	                                        	<button type="button" class="btn btn-link btn-sm" onclick="location.href='/rudisfarm/seller/seller-reconfirm'">
	                                           		<i class="fa fa-link"></i>&nbsp; 재승인 신청
	                                            </button>
                                        	</p>
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
                                    			<span style="color: orange;"><strong>재승인 신청</strong></span>
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
	                            </div>
	                            <div class="card-footer">
	                                <button type="button" class="btn btn-primary btn-sm" onclick="location.href='seller-info-modify-form'">
	                                    <i class="fa fa-dot-circle-o"></i> 회원 정보 수정
	                                </button>
	                                <button type="button" class="btn btn-danger btn-sm" onclick="location.href='seller-out'">
	                                    <i class="fa fa-ban"></i> 회원 탈퇴
	                                </button>
	                                <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='seller-index'">
	                                	메인 화면
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