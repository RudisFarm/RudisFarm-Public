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
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="au theme template">
	<meta name="author" content="Hau Nguyen">
	<meta name="keywords" content="au theme template">
	
	<!-- Title Page-->
	<title>admin 정산 조회</title>
	
	<jsp:include page="/resources/admin_bootstrap/commons/fontfaces_css.jsp"/>
    <jsp:include page="/resources/admin_bootstrap/commons/bootstrap_css.jsp"/>
    <jsp:include page="/resources/admin_bootstrap/commons/vendor_css.jsp"/>
    <jsp:include page="/resources/admin_bootstrap/commons/main_css.jsp"/>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#sort').change(function() {
				location.href='/rudisfarm/admin/admin-sellerincome-manage?sort='+$(this).val();
			});
		});
		
		function resultChange(id) {
			
			if(confirm('정산 처리 상태를 변경하시겠습니까?')) {
				$.ajax({
					type: 'PUT',
					url: '/rudisfarm/admin/admin-sellerincome-manage/'+id, 
					dataType: 'json',
					contentType: "application/json; charset=utf-8;",
					data: JSON.stringify({
								RESULT: $('#RESULT_'+id+' option:selected').val()
							}), 
					success: function(data) {
						if(data.resultCode == 1) {
							alert("정상적으로 처리되었습니다.");
							location.reload();
						} else {
							alert("처리에 실패했습니다.");
						}
					},
					error: function(e) {
						console.log("에러 발생!");
						console.log(e);
						alert("처리에 실패했습니다.");
					}
				});
			}
		}
	</script>
</head>

<body class="animsition">
	<div class="page-wrapper">
		<!-- HEADER MOBILE-->
		<jsp:include page="/resources/admin_bootstrap/commons/header_mobile.jsp" />
		<!-- END HEADER MOBILE-->

		<!-- MENU SIDEBAR-->
		<jsp:include page="/resources/admin_bootstrap/commons/sidebar.jsp" />
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
                        <div class="row">
                            <div class="col-md-12">
                                <!-- DATA TABLE -->
                                <h2 class="title-7 m-b-35">정산 요청 목록</h2>
                                <!-- 필터링 및 검색 시작 -->
								<form action="/rudisfarm/admin/admin-sellerincome-manage">
					            <div class="row">
                                  <div class="col-sm-12 col-md-3 col-lg-3">
                                    <select name="sort" id="sort" class="form-control">
	                                   <option value="REQUIRE_DATE" <c:if test='${sort eq "REQUIRE_DATE"}'>selected="selected"</c:if>>정산신청순</option>
                                       <option value="REQUIRE_INCOME" <c:if test='${sort eq "REQUIRE_INCOME"}'>selected="selected"</c:if>>요청금액순</option>
                                       <option value="ACCOUNT_BANK" <c:if test='${sort eq "ACCOUNT_BANK"}'>selected="selected"</c:if>>은행명순</option>
                                       <option value="ACCOUNT_NUMBER" <c:if test='${sort eq "ACCOUNT_NUMBER"}'>selected="selected"</c:if>>계좌번호순</option>
                                       <option value="RESULT" <c:if test='${sort eq "RESULT"}'>selected="selected"</c:if>>처리결과순</option>
	                                </select>
					              </div>
					              <div class="col-sm-12 col-md-9 col-lg-9">
					              <div class="row">
					              	<div class="col-4 pr-0">
				              			<select name="keywordType" id="keywordType" class="form-control">
		                                   <option value="ACCOUNT_BANK" <c:if test='${keywordType eq "ACCOUNT_BANK"}'>selected="selected"</c:if>>은행명</option>
	                                       <option value="ACCOUNT_NUMBER" <c:if test='${keywordType eq "ACCOUNT_NUMBER"}'>selected="selected"</c:if>>계좌번호</option>
	                                       <option value="RESULT" <c:if test='${keywordType eq "RESULT"}'>selected="selected"</c:if>>처리결과</option>
		                                </select>
					              		</div>
					              		<div class="col-8 pl-0">
					              			<div class="input-group">
							                	<input type="text" id="keyword" name="keyword" placeholder="검색어" class="form-control" value="${keyword}" onkeypress="JavaScript:press(this.form)">
							                	&nbsp;
		                                        <div class="input-group-btn">
		                                        	<button type="submit" class="btn btn-secondary">
		                                                <i class="fa fa-search"></i> 검색
			                                    	</button>
			                                	</div>
			                            	</div>
						            	</div>
						          	</div>
						          </div>
					            </div>
					            <br>
					            </form>
					            <!-- 필터링 및 검색 끝 -->
                                <div class="table-responsive table-responsive-data2">
                                    <table class="table table-data2">
                                    <c:if test="${sllerIncomePagenation.getList().size() ne 0}">
                                        <thead>
                                        </thead>
                                        <tbody>
                                       		<c:forEach var="sllerIncome" items="${sllerIncomePagenation.getList()}">
											<tr class="tr-shadow">
                                        		<td>
                                        			<div class="row p-2">
                                        				<div class="col-sm-12 col-md-12 col-lg-12 p-1">
                                        					<h5>요청 번호 - ${sllerIncome.getSELLER_INCOME_ID()}</h5>
                                        				</div>
                                        			</div>
                                        			<div class="row p-2">
                                        				<div class="col-sm-12 col-md-12 col-lg-6 p-1">
                                        					<div class="row p-2">
                                        						<div class="col-sm-12 col-md-6 col-lg-6 p-1">
                                        							<strong>판매자 아이디</strong><br>${sllerIncome.getUSER_ID()}
                                        						</div>
                                        						<div class="col-sm-12 col-md-6 col-lg-6 p-1">
                                        							<strong>신청 계좌</strong><br>${sllerIncome.getACCOUNT_NAME()}<br>${sllerIncome.getACCOUNT_NUMBER()}(${sllerIncome.getACCOUNT_BANK()})
                                        						</div>
                                        					</div>
                                        				</div>
                                        				<div class="col-sm-12 col-md-12 col-lg-6 p-1">
                                        					<div class="row p-2">
                                        						<div class="col-sm-12 col-md-6 col-lg-6 p-1">
                                        							<strong>정산 요청 금액</strong><br>
                                        							<span id="REQUIRE_INCOME_${sllerIncome.getSELLER_INCOME_ID()}">
                                        								<fmt:formatNumber value="${sllerIncome.getREQUIRE_INCOME()}" type="number"/>원<br>
                                        								(실수령 <fmt:formatNumber value="${sllerIncome.getACTUAL_INCOME()}" type="number"/>원, 수수료 <fmt:formatNumber value="${sllerIncome.getFEES()}" type="number"/>원)
                                        							</span>
                                        						</div>
                                        						<div class="col-sm-12 col-md-6 col-lg-6 p-1">
                                        							<strong>정산 요청 날짜</strong><br>${sllerIncome.getREQUIRE_DATE()}
                                        						</div>
                                        					</div>
                                        				</div>
                                        				<div class="col-sm-12 col-md-12 col-lg-6 p-1">
                                        					<div class="row p-2">
                                        						<div class="col-sm-12 col-md-6 col-lg-6 p-1">
                                        							<strong>처리 결과</strong><br>
                                        							<c:choose>
						                                       		<c:when test="${sllerIncome.getRESULT() eq 0}">
					                                       			<span style="color: blue;"><strong id="RESULT_TEXT">정산 신청</strong></span>
						                                       		</c:when>
						                                       		<c:when test="${sllerIncome.getRESULT() eq 1}">
					                                       			<span style="color: green;"><strong id="RESULT_TEXT">정산 승인</strong></span>
					                                       			(${sllerIncome.getPROCESSED_DATE()})
						                                       		</c:when>
						                                       		<c:when test="${sllerIncome.getRESULT() eq 2}">
					                                       			<span style="color: red;"><strong id="RESULT_TEXT">정산 거부</strong></span>
					                                       			(${sllerIncome.getPROCESSED_DATE()})
						                                       		</c:when>
						                                           	</c:choose>
                                        						</div>
                                        					</div>
                                        				</div>
                                        			</div>
                                        			<c:if test="${sllerIncome.getRESULT() eq 0}">
                                        			<div class="row p-2">
                                        				<div class="col-sm-12 col-md-12 col-lg-12 p-1">
                                        					<div class="input-group">
	                                        					<select name="RESULT_${sllerIncome.getSELLER_INCOME_ID()}" id="RESULT_${sllerIncome.getSELLER_INCOME_ID()}" class="form-control">
	                                        					   <option>--처리 상태 변경--</option>
								                                   <option value="1">정산 승인</option>
							                                       <option value="2">정산 거부</option>
								                                </select>
								                                &nbsp;
								                                <div class="input-group-btn">
						                                        	<button id="resultChangeBtn" type="button" class="btn btn-secondary" onclick="resultChange(${sllerIncome.getSELLER_INCOME_ID()});">
						                                                변경
							                                    	</button>
							                                	</div>
							                                </div>
                                        				</div>
                                        			</div>
                                        			</c:if>
                                        		</td>
                                        	</tr>
                                            <tr class="spacer"></tr>
                                            </c:forEach>
                                        </tbody>
                                    </c:if>
	                                <c:if test="${sllerIncomePagenation.getList().size() eq 0}">
	                               		정산 요청 내역이 없습니다.
	                               	</c:if>
                                    </table>
                                </div>
                                <!-- 페이지네이션 시작 -->
                                <div class="row text-center p-3">
									<div style="float:none; margin:0 auto">
		                                 <ul class="pagination">
											<c:if test="${fn:length(sllerIncomePagenation.getList()) > 0}">
												<c:choose>
													<c:when test="${sllerIncomePagenation.startPage eq 1}">
														<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">이전</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item"><a class="page-link" href="/rudisfarm/admin/admin-sellerincome-manage?page=${sllerIncomePagenation.startPage-1}${keywordTypeUrl}${keywordUrl}${sortUrl}">이전</a></li>
													</c:otherwise>
												</c:choose>
												<c:forEach var="currentPage" begin="${sllerIncomePagenation.startPage}" end="${sllerIncomePagenation.endPage}">
													<c:choose>
														<c:when test="${currentPage eq sllerIncomePagenation.page}">
															<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">${currentPage}</a></li>
														</c:when>
														<c:otherwise>
															<li class="page-item"><a class="page-link" href="/rudisfarm/admin/admin-sellerincome-manage?page=${currentPage}${keywordTypeUrl}${keywordUrl}${sortUrl}">${currentPage}</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												
												<c:choose>
													<c:when test="${sllerIncomePagenation.endPage eq sllerIncomePagenation.maxPage}">
														<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">다음</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item"><a class="page-link" href="/rudisfarm/admin/admin-sellerincome-manage?page=${sllerIncomePagenation.endPage+1}${keywordTypeUrl}${keywordUrl}${sortUrl}">다음</a>
													</c:otherwise>
												</c:choose>
											</c:if>
									    </ul> 
									</div>
								</div>
								<!-- 페이지네이션 끝 -->
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

	<!-- Jquery JS-->
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap JS-->
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-4.1/popper.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-4.1/bootstrap.min.js"></script>
	<!-- Vendor JS       -->
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/slick/slick.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/wow/wow.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/animsition/animsition.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/counter-up/jquery.waypoints.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/counter-up/jquery.counterup.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/circle-progress/circle-progress.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/chartjs/Chart.bundle.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/select2/select2.min.js"></script>

	<!-- Main JS-->
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/js/main.js"></script>

</body>
</html>