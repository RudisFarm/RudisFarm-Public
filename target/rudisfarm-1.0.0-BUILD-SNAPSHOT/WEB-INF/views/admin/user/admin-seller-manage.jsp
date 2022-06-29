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
    <title>Dashboard</title>

    <jsp:include page="/resources/admin_bootstrap/commons/fontfaces_css.jsp"/>
    <jsp:include page="/resources/admin_bootstrap/commons/bootstrap_css.jsp"/>
    <jsp:include page="/resources/admin_bootstrap/commons/vendor_css.jsp"/>
    <jsp:include page="/resources/admin_bootstrap/commons/main_css.jsp"/>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$('button[name=del]').click(function() {
				console.log("클릭?");
			})
		});
		
		function del(id) {
			console.log(id+"를 삭제 시도");
		}
	</script>
</head>

<body class="animsition">
    <div class="page-wrapper">
        <!-- HEADER MOBILE-->
        <jsp:include page="/resources/admin_bootstrap/commons/header_mobile.jsp"/>
        <!-- END HEADER MOBILE-->

        <!-- MENU SIDEBAR-->
        <jsp:include page="/resources/admin_bootstrap/commons/sidebar.jsp"/>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <jsp:include page="/resources/admin_bootstrap/commons/header_desktop.jsp"/>
            <!-- HEADER DESKTOP-->

            <!-- MAIN CONTENT-->
            <div class="main-content">
            	<div class="section__content section__content--p30">
                	<div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <!-- DATA TABLE -->
                                <h2 class="title-7 m-b-35">판매자 목록</h2>
                                <div class="table-data__tool">
                                    <div class="table-data__tool-left">
                                        <div class="rs-select2--light rs-select2--md">
                                            <select class="js-select2" name="property">
                                                <option selected="selected">가입일순</option>
                                                <option value="">아이디순</option>
                                                <option value="">업체명순</option>
                                            </select>
                                            <div class="dropDownSelect2"></div>
                                        </div>
                                        <button class="au-btn-filter">
                                            <i class="zmdi zmdi-filter-list"></i>정렬
                                        </button>
                                    </div>
                                </div>
                                <div class="table-responsive table-responsive-data2">
                                    <table class="table table-data2">
                                        <thead>
                                            <tr class="d-flex">
                                                <th class="col-2">아이디(이메일)</th>
                                                <th class="col-2">업체명</th>
                                                <th class="col-1">가입일자</th>
                                                <th class="col-2">사업자 등록 번호</th>
                                                <th class="col-3">조회 결과</th>
                                                <th class="col-2">상태</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:if test="${sellerList ne null}">
                                       		<c:forEach var="seller" items="${sellerList}">
                                            <tr class="tr-shadow d-flex" onclick="location.href='admin-seller-manage/${seller.getUSER_ID()}'" style="cursor:pointer;">
                                                <td class="col-2">
                                                	<div class="table-data__info">
		                                                <h6>${seller.getUSER_ID()}</h6>
		                                                <span>
		                                                	<a>${seller.getEMAIL()}</a>
		                                                </span>
	                                                </div>
                                                </td>
                                                <td class="col-2">${seller.getNAME()}</td>
                                                <td class="col-1">${seller.getJOINDATE()}</td>
                                                <td class="col-2">${seller.getSERIAL()}</td>
                                                <td class="col-3">${seller.getSERIAL_RESULT()}</td>
                                                <td class="col-2">
												<c:choose>
                                           		<c:when test="${seller.getSTATUS() eq 0}">
                                           			<span style="color: gray;"><strong>미승인</strong></span>
                                           		</c:when>
                                           		<c:when test="${seller.getSTATUS() eq 1}">
                                           			<span style="color: green;"><strong>승인</strong></span>
                                           		</c:when>
                                           		<c:when test="${seller.getSTATUS() eq 2}">
                                           			<span style="color: red;"><strong>정지</strong></span>
                                           		</c:when>
                                           		<c:when test="${seller.getSTATUS() eq 3}">
                                           			<span style="color: orange;"><strong>재승인 신청</strong></span>
                                           		</c:when>
                                           		<c:when test="${seller.getSTATUS() eq 4}">
                                           			<span style="color: orangered;"><strong>재승인 거부</strong></span>
                                           		</c:when>
                                           		<c:when test="${seller.getSTATUS() eq 5}">
                                           			<span style="color: black;"><strong>탈퇴</strong></span>
                                           		</c:when>
                                           		</c:choose>
                                            </tr>
                                            <tr class="spacer"></tr>
                                            </c:forEach>
                                        	</c:if>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- END DATA TABLE -->
                            </div>
                        </div>
       				</div>
               </div>
            </div>
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
        </div>

    </div>

    <jsp:include page="/resources/admin_bootstrap/commons/js.jsp"/>

</body>
</html>