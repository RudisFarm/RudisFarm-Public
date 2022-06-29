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
    <title>판매자 정산 신청/조회</title>

    <jsp:include page="/resources/admin_bootstrap/commons/fontfaces_css.jsp"/>
    <jsp:include page="/resources/admin_bootstrap/commons/bootstrap_css.jsp"/>
    <jsp:include page="/resources/admin_bootstrap/commons/vendor_css.jsp"/>
    <jsp:include page="/resources/admin_bootstrap/commons/main_css.jsp"/>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#sort').change(function() {
				location.href='/rudisfarm/seller/seller-sellerincome-manage?sort='+$(this).val();
			});
			
			$('#requestNewIncome').click(function() {
				confirm('입력하신 정보로 정산 신청하시겠습니까?'); {
		    		if ($("#REQUIRE_INCOME").val() == "") { 
		    			alert("정산 금액을 입력해주세요.");
		    			$("#REQUIRE_INCOME").focus();
		    			return false;
					}
		    		
		    		if ($("#ACCOUNT_NAME").val() == "") { 
		    			alert("계좌주를 입력해주세요.");
		    			$("#ACCOUNT_NAME").focus();
		    			return false;
					}
		    		
		    		if ($("#ACCOUNT_BANK").val() == "") { 
		    			alert("은행명을 선택해주세요.");
		    			$("#ACCOUNT_BANK").focus();
		    			return false;
					}
		    		
		    		if ($("#ACCOUNT_NUMBER").val() == "") { 
		    			alert("계좌번호를 입력해주세요.");
		    			$("#ACCOUNT_NUMBER").focus();
		    			return false;
					}
					
					$.ajax({
						type: 'POST',
						url: '/rudisfarm/seller/seller-sellerincome-manage', 
						dataType: 'json',
						contentType: "application/json; charset=utf-8;",
						data: JSON.stringify({
									REQUIRE_INCOME: $('#REQUIRE_INCOME').val(),
									ACCOUNT_NAME: $('#ACCOUNT_NAME').val(),
									ACCOUNT_BANK: $('#ACCOUNT_BANK option:selected').val(),
									ACCOUNT_NUMBER: $('#ACCOUNT_NUMBER').val()
								}), 
						success: function(data) {
							if(data.resultCode == 1) {
								alert("정상적으로 신청되었습니다.");
								location.reload();
							} else if(data.resultCode == -1) {
								alert("신청 금액이 신청 가능 한도를 초과하였습니다.");
							} else {
								alert("신청에 실패했습니다. 관리자에게 문의해주세요.");
							}
						},
						error: function(e) {
							console.log("에러 발생!");
							console.log(e);
							alert("신청에 실패했습니다. 관리자에게 문의해주세요.");
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
       					<div class="row">
                            <div class="col-md-12">
                            	<!-- 정산 요청 폼 시작 -->
                            	<div class="card">
                                    <div class="card-header">
                                        <strong>정산 신청</strong>
                                    </div>
                                    <div class="card-body card-block">
                                        <form action="" method="post" class="form-horizontal">
                                        	<div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label class=" form-control-label">현재 정산 가능 금액</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <p class="form-control-static" id="CURRENT_INCOME">
                                                    	<fmt:formatNumber value="${selectSellerCurrentIncome}" type="number"/>원
                                                    </p>
                                                </div>
                                            </div>
                                        	<div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="text-input" class=" form-control-label">정산 신청 금액</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="number" id="REQUIRE_INCOME" name="text-input" placeholder="정산 신청 금액" min="0" step="100" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="text-input" class=" form-control-label">계좌주</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="ACCOUNT_NAME" name="text-input" placeholder="계좌주" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="ACCOUNT_BANK" class=" form-control-label">은행명</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <select name="ACCOUNT_BANK" id="ACCOUNT_BANK" class="form-control">
                                                        <option>은행 선택</option>
                                                        <option value="국민은행">KB국민은행</option>
                                                        <option value="신한은행">신한은행</option>
                                                        <option value="우리은행">우리은행</option>
                                                        <option value="하나은행">하나은행</option>
                                                        <option value="NH농협은행">NH농협은행</option>
                                                        <option value="수협은행">수협은행</option>
                                                        <option value="부산은행">부산은행</option>
                                                        <option value="경남은행">경남은행</option>
                                                        <option value="광주은행">광주은행</option>
                                                        <option value="대구은행">대구은행</option>
                                                        <option value="전북은행">전북은행</option>
                                                        <option value="제주은행">제주은행</option>
                                                    </select>
                                                </div>
                                            </div>
<!--                                             <div class="row form-group"> -->
<!--                                                 <div class="col col-md-3"> -->
<!--                                                     <label for="text-input" class=" form-control-label">은행명</label> -->
<!--                                                 </div> -->
<!--                                                 <div class="col-12 col-md-9"> -->
<!--                                                     <input type="text" id="ACCOUNT_BANK" name="text-input" placeholder="은행명" class="form-control"> -->
<!--                                                 </div> -->
<!--                                             </div> -->
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="text-input" class=" form-control-label">계좌번호</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="ACCOUNT_NUMBER" name="text-input" placeholder="계좌번호" class="form-control">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer">
                                        <button id="requestNewIncome" type="button" class="btn btn-primary btn-sm">
                                            <i class="fa fa-dot-circle-o"></i> 신청하기
                                        </button>
                                    </div>
                                </div>
                                <!-- 정산 요청 끝 -->
                            </div>
                        </div>
       				</div>
                	<div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <!-- DATA TABLE -->
                                <h2 class="title-7 m-b-35">정산 요청 목록</h2>
                                <!-- 필터링 및 검색 시작 -->
								<form action="/rudisfarm/seller/seller-sellerincome-manage">
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
                                        				<div class="col-sm-12 col-md-12 col-lg-6 p-1">
                                        					<h5>요청 번호 - ${sllerIncome.getSELLER_INCOME_ID()}</h5>
                                        				</div>
                                        				<div class="col-sm-12 col-md-12 col-lg-6 p-1">
                                        					
                                        				</div>
                                        			</div>
                                        			<div class="row p-2">
                                        				<div class="col-sm-12 col-md-12 col-lg-6 p-1">
                                        					<div class="row p-2">
                                        						<div class="col-sm-12 col-md-6 col-lg-6 p-1">
                                        							<strong>정산 요청 금액</strong><br>
                                        							<fmt:formatNumber value="${sllerIncome.getREQUIRE_INCOME()}" type="number"/>원<br>
                                        							(실수령 <fmt:formatNumber value="${sllerIncome.getACTUAL_INCOME()}" type="number"/>원, 수수료 <fmt:formatNumber value="${sllerIncome.getFEES()}" type="number"/>원)
                                        						</div>
                                        						<div class="col-sm-12 col-md-6 col-lg-6 p-1">
                                        							<strong>신청 계좌</strong><br>${sllerIncome.getACCOUNT_NAME()}<br>${sllerIncome.getACCOUNT_NUMBER()}(${sllerIncome.getACCOUNT_BANK()})
                                        						</div>
                                        					</div>
                                        				</div>
                                        				<div class="col-sm-12 col-md-12 col-lg-6 p-1">
                                        					<div class="row p-2">
                                        						<div class="col-sm-12 col-md-6 col-lg-6 p-1">
                                        							<strong>처리 결과</strong><br>
                                        							<c:choose>
						                                       		<c:when test="${sllerIncome.getRESULT() eq 0}">
					                                       			<span style="color: gray;"><strong id="RESULT_TEXT">정산 신청</strong></span>
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
                                        						<div class="col-sm-12 col-md-6 col-lg-6 p-1">
                                        							<strong>정산 요청 날짜</strong><br>${sllerIncome.getREQUIRE_DATE()}
                                        						</div>
                                        					</div>
                                        				</div>
                                        			</div>
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
														<li class="page-item"><a class="page-link" href="/rudisfarm/seller/seller-sellerincome-manage?page=${sllerIncomePagenation.startPage-1}${keywordTypeUrl}${keywordUrl}${sortUrl}">이전</a></li>
													</c:otherwise>
												</c:choose>
												<c:forEach var="currentPage" begin="${sllerIncomePagenation.startPage}" end="${sllerIncomePagenation.endPage}">
													<c:choose>
														<c:when test="${currentPage eq sllerIncomePagenation.page}">
															<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">${currentPage}</a></li>
														</c:when>
														<c:otherwise>
															<li class="page-item"><a class="page-link" href="/rudisfarm/seller/seller-sellerincome-manage?page=${currentPage}${keywordTypeUrl}${keywordUrl}${sortUrl}">${currentPage}</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												
												<c:choose>
													<c:when test="${sllerIncomePagenation.endPage eq sllerIncomePagenation.maxPage}">
														<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">다음</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item"><a class="page-link" href="/rudisfarm/seller/seller-sellerincome-manage?page=${sllerIncomePagenation.endPage+1}${keywordTypeUrl}${keywordUrl}${sortUrl}">다음</a>
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

    <jsp:include page="/resources/admin_bootstrap/commons/js.jsp"/>

</body>
</html>