<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/table-responsive.css" type="text/css" media="all"/>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
    	$(function() {
    		$('#statusUpdate').click(function() {
    			if($('#STATUS option:selected').val() == '---선택---') {
    				alert('변경할 계정 상태를 먼저 선택해주세요.');
    			} else {
    				var statusUpdateCheck = confirm("판매자 상태를 변경하시겠습니까?");
        			
        			if(statusUpdateCheck) {
        				if($('#STATUS option:selected').val() != 6) {
        					$.ajax({
            					type: 'PUT',
            					url: '/rudisfarm/admin/admin-seller-manage/'+$('#USER_ID').html(), 
            					dataType: 'json',
            					contentType: "application/json; charset=utf-8;",
            					data: JSON.stringify({
            								EMAIL: $('#EMAIL').html(),
            								STATUS: $('#STATUS option:selected').val()
            							}), 
            					success: function(data) {
            						if(data.resultCode == 1) {
            							alert("판매자 상태가 변경되었습니다.");
            							location.reload();
            						} else {
            							alert("판매자 상태 변경에 실패했습니다.");
            						}
            					},
            					error: function(e) {
            						console.log("에러 발생!");
            						console.log(e);
            					}
            				});
        				} else {
        					if($('#STATUS_TEXT').html() == '미승인') {
        						var statusDeleteCheck = confirm("가입 거부시 가입 신청한 판매자 정보 및 상품 정보가 삭제됩니다.\n정말로 거부하시겠습니까?");
            					
            					if(statusDeleteCheck) {
            						
            						$.ajax({
        	        					type: 'DELETE',
        	        					url: '/rudisfarm/admin/admin-seller-manage/'+$('#USER_ID').html(), 
        	        					dataType: 'json',
        	        					contentType: "application/json; charset=utf-8;",
        	        					data: JSON.stringify({
        	        						EMAIL: $('#EMAIL').html(),
            								STATUS: $('#STATUS option:selected').val()
            							}),
        	        					success: function(data) {
        	        						if(data.resultCode == 1) {
        	        							alert("판매자 가입이 거부되었습니다.");
        	        							location.href="/rudisfarm/admin/admin-seller-manage${pageUrl}${keywordTypeUrl}${keywordUrl}${sortUrl}";
        	        						} else {
        	        							alert("판매자 상태 변경에 실패했습니다.");
        	        						}
        	        					},
        	        					error: function(e) {
        	        						console.log("에러 발생!");
        	        						console.log(e);
        	        					}
                					});
            					}
        					} else if($('#STATUS_TEXT').html() == '재승인') {
//         						$.ajax({
//                 					type: 'PUT',
//                 					url: '/rudisfarm/admin/admin-seller-manage/'+$('#USER_ID').html(), 
//                 					dataType: 'json',
//                 					contentType: "application/json; charset=utf-8;",
//                 					data: JSON.stringify({
//                 								STATUS: $('#STATUS option:selected').val()
//                 							}), 
//                 					success: function(data) {
//                 						if(data.resultCode == 1) {
//                 							alert("판매자 상태가 변경되었습니다.");
//                 							location.reload();
//                 						} else {
//                 							alert("판매자 상태 변경에 실패했습니다.");
//                 						}
//                 					},
//                 					error: function(e) {
//                 						console.log("에러 발생!");
//                 						console.log(e);
//                 					}
//                 				});
        					}
        				}
        			}
    			}
    		});
    	});
    	
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
		               <div class="col-lg-12">
	                        <div class="card">
	                            <div class="card-header">
	                                <strong>판매자 회원 정보</strong>
	                            </div>
	                            <div class="card-body card-block">
                                	<div class="row form-group">
                                        <div class="col col-md-3">
                                            <label class="form-control-label"><strong>아이디</strong></label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static" id="USER_ID">${resultUserVO.getUSER_ID()}</p>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label class=" form-control-label"><strong>이메일</strong></label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static" id="EMAIL">${resultUserVO.getEMAIL()}</p>
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
	                                        	${resultUserVO.getSERIAL()}
                                        	</p>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label class=" form-control-label"><strong>사업자 등록 번호 조회 결과</strong></label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                        	<p class="form-control-static">
	                                        	${resultUserVO.getSERIAL_RESULT()}
                                        	</p>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label class=" form-control-label"><strong>사업자 등록증 증빙자료</strong></label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">
                                            	<img alt="" src="/rudisfarm/resources/upload/images/user/${resultUserVO.USER_ID}/${resultUserVO.FILE}">
                                            </p>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label class=" form-control-label"><strong>현재 계정 상태</strong></label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <p class="form-control-static">
                                           	<c:choose>
                                       		<c:when test="${resultUserVO.getSTATUS() eq 0}">
                                       			<span style="color: gray;"><strong id="STATUS_TEXT">미승인</strong></span>
                                       			<small class="help-block form-text">판매 승인되지 않은 계정입니다.</small>
                                       		</c:when>
                                       		<c:when test="${resultUserVO.getSTATUS() eq 1}">
                                       			<span style="color: green;"><strong id="STATUS_TEXT">승인</strong></span>
                                       			<small class="help-block form-text">판매 승인된 계정입니다.</small>
                                       		</c:when>
                                       		<c:when test="${resultUserVO.getSTATUS() eq 2}">
                                       			<span style="color: red;"><strong id="STATUS_TEXT">정지</strong></span>
                                       			<small class="help-block form-text">운영 정책을 위반하여 판매 정지된 계정입니다.</small>
                                       		</c:when>
                                       		<c:when test="${resultUserVO.getSTATUS() eq 3}">
                                       			<span style="color: orange;"><strong id="STATUS_TEXT">재승인 신청</strong></span>
                                       			<small class="help-block form-text">사업자 인증 번호를 변경하여 재승인이 필요한 계정입니다.</small>
                                       		</c:when>
                                       		<c:when test="${resultUserVO.getSTATUS() eq 4}">
                                       			<span style="color: orangered;"><strong id="STATUS_TEXT">재승인 거부</strong></span>
                                       			<small class="help-block form-text">재승인 요청이 관리자에 의해 거부된 계정입니다.</small>
                                       		</c:when>
                                       		<c:when test="${resultUserVO.getSTATUS() eq 5}">
                                       			<span style="color: black;"><strong id="STATUS_TEXT">탈퇴</strong></span>
                                       			<small class="help-block form-text">탈퇴 완료된 계정입니다.</small>
                                       		</c:when>
                                           	</c:choose>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label class=" form-control-label"><strong>계정 상태 변경</strong></label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                        	<p class="form-control-static">
                                        	<c:choose>
                                        	<c:when test="${resultUserVO.getSTATUS() lt 4}">
                                        		<div class="row">
                                        			<select class="col col-sm-3 form-control" id="STATUS">
                                        				<option selected="selected">---선택---</option>
				                                		<c:choose>
				                                		<c:when test="${resultUserVO.getSTATUS() eq 0}">
				                                		<option value="1">승인</option>
				                                		<option value="6">거부</option>
				                                		</c:when>
				                                		<c:when test="${resultUserVO.getSTATUS() eq 1}">
				                                		<option value="2">정지</option>
				                                		</c:when>
				                                		<c:when test="${resultUserVO.getSTATUS() eq 2}">
				                                		<option value="1">승인</option>
				                                		</c:when>
				                                		<c:when test="${resultUserVO.getSTATUS() eq 3}">
				                                		<option value="1">승인</option>
				                                		<option value="4">재승인 거부</option>
				                                		</c:when>
				                                		</c:choose>
				                                    </select>
<!-- 	                                        		<select class="col col-sm-3 form-control" id="STATUS"> -->
<%-- 				                                		<c:forEach var="status" items="${statusList}"> --%>
<%-- 				                                		<c:choose> --%>
<%-- 				                                		<c:when test="${status eq '---선택---'}"> --%>
<%-- 				                                		<option selected="selected">${status}</option> --%>
<%-- 				                                		</c:when> --%>
<%-- 				                                		<c:when test="${status eq '정지'}"> --%>
<%-- 				                                		<c:if test="${resultUserVO.getSTATUS() ne 0}"> --%>
<%-- 				                                		<option value="${statusList.indexOf(status)}">${status}</option> --%>
<%-- 				                                		</c:if> --%>
<%-- 				                                		</c:when> --%>
<%-- 				                                		<c:otherwise> --%>
<%-- 				                                		<option value="${statusList.indexOf(status)}">${status}</option> --%>
<%-- 				                                		</c:otherwise> --%>
<%-- 				                                		</c:choose> --%>
<%-- 				                                		</c:forEach> --%>
<%-- 				                                		<c:if test="${resultUserVO.getSTATUS() eq 3}"> --%>
<!-- 				                                		<option value="4">재승인 거부</option> -->
<%-- 				                                		</c:if> --%>
<%-- 				                                		<c:if test="${resultUserVO.getSTATUS() eq 0}"> --%>
<!-- 				                                		<option value="6">거부</option> -->
<%-- 				                                		</c:if> --%>
<!-- 				                                    </select> -->
				                                    &nbsp;
				                                	<button type="button" class="btn btn-primary" id="statusUpdate">변경</button>
                                        		</div>
                                        	</c:when>
                                        	<c:when test="${resultUserVO.getSTATUS() eq 4}">
	                                			이미 재승인 거부 처리되었습니다.
	                                		</c:when>
	                                		<c:when test="${resultUserVO.getSTATUS() eq 5}">
	                                			이미 탈퇴가 완료되어 상태 변경이 불가능합니다.
	                                		</c:when>
                                        	</c:choose>
                                        	</p>
                                        </div>
                                    </div>
	                            </div>
	                            <div class="card-footer">
	                                <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/rudisfarm/admin/admin-seller-manage${pageUrl}${keywordTypeUrl}${keywordUrl}${sortUrl}'">
	                                	목록
	                                </button>
	                            </div>
	                        </div>
	                    </div>
		            </div>
            	</div>
              <div class="table-desktop">
            	<div class="section__content section__content--p30">
		            <div class="container-fluid">
		               <div class="col-lg-12">
	                        <div class="card">
	                            <div class="card-header">
	                                <strong>판매자 주문 정보</strong>
	                            </div>
	                            <div class="row form-group">
	                            <div class="card-body card-block">
	                                     <table class="table table-borderless table-data3" style="word-break:keep-all;">
											<thead align="center">
												<tr>
													<th>주문번호</th>
													<th>주문자명</th>
													<th>주문상태</th>
													<th>주문메세지</th>
													<th>상품명</th>
													<th>결제총액</th>
													<th>결제날짜</th>
												</tr>
											</thead>
											<c:forEach var="adminPaymentList" items="${superadminseller.adminsellerList}">
												<tbody align="center">
													<tr>
														<td>${adminPaymentList.PARTNER_ORDER_ID}</td>
														<td>${adminPaymentList.USER_NAME}</td>
														<td>${adminPaymentList.STATUS}</td>
														<td>${adminPaymentList.DELIVERY_MESSAGE}</td>
														<td>${adminPaymentList.ITEM_NAME}</td>
														<td>${adminPaymentList.TOTAL_AMOUNT}</td>
														<td>${adminPaymentList.APPROVED_AT}</td>
													</tr>
												</tbody>
											</c:forEach>
										</table>
                                    </div>
                                   </div>
                                    <div style="text-align: center; margin-left: auto; margin-right: auto;">
	                                    <ul class="pagination" >
												<c:choose>
													<c:when test="${fn:length(superadminseller.adminsellerList) > 0}">
													<c:choose>
														<c:when test="${superadminseller.page <= 1}">
															<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">이전</a></li>
														</c:when>
														<c:otherwise>
															<li class="page-item"><a class="page-link" href="/rudisfarm/admin/admin-seller-manage/${resultUserVO.getUSER_ID()}?page=${superadminseller.page-1}">이전</a></li>
														</c:otherwise>
													</c:choose>
													<c:forEach var="startNum" begin="${superadminseller.startPage}" end="${superadminseller.endPage}">
														<c:choose>
															<c:when test="${startNum eq superadminseller.page}">
																<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">${startNum}</a></li>
															</c:when>
															<c:otherwise>
																<li class="page-item"><a class="page-link" href="/rudisfarm/admin/admin-seller-manage/${resultUserVO.getUSER_ID()}?page=${startNum}">${startNum}</a></li>
															</c:otherwise>
														</c:choose>
													</c:forEach>
													
													<c:choose>
														<c:when test="${superadminseller.page ge superadminseller.maxPage}">
															<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">다음</a></li>
														</c:when>
														<c:otherwise>
															<li class="page-item"><a class="page-link" href="/rudisfarm/admin/admin-seller-manage/${resultUserVO.getUSER_ID()}?page=${superadminseller.page+1}">다음</a>
														</c:otherwise>
													</c:choose>
												</c:when>
													<c:otherwise>
														
													</c:otherwise>
												</c:choose>
										    </ul>
									  	 </div>
	                                    <div class="card-footer">
			                               <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/rudisfarm/admin/admin-seller-manage'">
			                                	목록
			                               </button>
	                            	</div>
	                            </div>
	                        </div>
	                    </div>     
		            </div>
            	</div>
            	<div class="table-mobile">
            	<div class="section__content section__content--p30">
		            <div class="container-fixed">
		               <div class="col-lg-12">
	                        <div class="card">
	                            <div class="card-header">
	                                <strong>판매자 주문 정보</strong>
	                            </div>
	                            <div class="card-body card-block">
	                                     <table class="table table-borderless table-data3" style="word-break:keep-all;">
	                                       <c:forEach var="adminPaymentList" items="${superadminseller.adminsellerList}">
											<thead align="center">
												<tr>
													<th>주문내역</th>
													<th></th>
												</tr>
											</thead>
												<tbody align="center" id="listBody">
													<tr>
													  <td>
														주문번호
														주문자명
														주문상태
														주문메시지
														상품명
														결제총액
														결제날짜
													  </td>
													  <td>
														${adminPaymentList.PARTNER_ORDER_ID}
														${adminPaymentList.USER_NAME}
														${adminPaymentList.STATUS}
														${adminPaymentList.DELIVERY_MESSAGE}
														${adminPaymentList.ITEM_NAME}
														${adminPaymentList.TOTAL_AMOUNT}
														${adminPaymentList.APPROVED_AT}
													  </td>
													</tr>
												</tbody>
											</c:forEach>
										</table>
                                    </div>
                                    <div style="text-align: center; margin-left: auto; margin-right: auto;">
	                                    <ul class="pagination" >
												<c:choose>
													<c:when test="${fn:length(superadminseller.adminsellerList) > 0}">
													<c:choose>
														<c:when test="${superadminseller.page <= 1}">
															<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">이전</a></li>
														</c:when>
														<c:otherwise>
															<li class="page-item"><a class="page-link" href="/rudisfarm/admin/admin-seller-manage/${resultUserVO.getUSER_ID()}?page=${superadminseller.page-1}">이전</a></li>
														</c:otherwise>
													</c:choose>
													<c:forEach var="startNum" begin="${superadminseller.startPage}" end="${superadminseller.endPage}">
														<c:choose>
															<c:when test="${startNum eq superadminseller.page}">
																<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">${startNum}</a></li>
															</c:when>
															<c:otherwise>
																<li class="page-item"><a class="page-link" href="/rudisfarm/admin/admin-seller-manage/${resultUserVO.getUSER_ID()}?page=${startNum}">${startNum}</a></li>
															</c:otherwise>
														</c:choose>
													</c:forEach>
													
													<c:choose>
														<c:when test="${superadminseller.page ge superadminseller.maxPage}">
															<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">다음</a></li>
														</c:when>
														<c:otherwise>
															<li class="page-item"><a class="page-link" href="/rudisfarm/admin/admin-seller-manage/${resultUserVO.getUSER_ID()}?page=${superadminseller.page+1}">다음</a>
														</c:otherwise>
													</c:choose>
												</c:when>
													<c:otherwise>
														
													</c:otherwise>
												</c:choose>
										    </ul>
									  	 </div>
	                                    <div class="card-footer">
			                               <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/rudisfarm/admin/admin-seller-manage'">
			                                	목록
			                               </button>
	                            	</div>
	                            </div>
	                        </div>
	                    </div>     
		            </div>
            	</div>
            </div>
         </div>
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
        </div>
    <jsp:include page="/resources/admin_bootstrap/commons/js.jsp"/>

</body>
</html>