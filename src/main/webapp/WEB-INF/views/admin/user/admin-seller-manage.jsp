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
			$('#sort').change(function() {
				location.href='/rudisfarm/admin/admin-seller-manage?sort='+$(this).val();
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
                		
                        <div class="row">
                            <div class="col-md-12">
                                <!-- DATA TABLE -->
                                <h2 class="title-7 m-b-35">판매자 목록</h2>
                                <!-- 필터링 및 검색 시작 -->
								<form action="/rudisfarm/admin/admin-seller-manage">
					            <div class="row">
                                  <div class="col-sm-12 col-md-3 col-lg-3">
                                    <select name="sort" id="sort" class="form-control">
	                                   <option value="JOINDATE" <c:if test='${sort eq "JOINDATE"}'>selected="selected"</c:if>>가입일순</option>
                                       <option value="STATUS" <c:if test='${sort eq "STATUS"}'>selected="selected"</c:if>>상태순</option>
                                       <option value="USER_ID" <c:if test='${sort eq "USER_ID"}'>selected="selected"</c:if>>아이디순</option>
                                       <option value="USER_NAME" <c:if test='${sort eq "USER_NAME"}'>selected="selected"</c:if>>이름순</option>
                                       <option value="COMPANY_NAME" <c:if test='${sort eq "COMPANY_NAME"}'>selected="selected"</c:if>>업체명순</option>
	                                </select>
					              </div>
					              <div class="col-sm-12 col-md-9 col-lg-9">
					              <div class="row">
					              	<div class="col-4 pr-0">
				              			<select name="keywordType" id="keywordType" class="form-control">
		                                   <option value="USER_ID" <c:if test='${keywordType eq "USER_ID"}'>selected="selected"</c:if>>아이디</option>
	                                       <option value="USER_NAME" <c:if test='${keywordType eq "USER_NAME"}'>selected="selected"</c:if>>이름</option>
	                                       <option value="COMPANY_NAME" <c:if test='${keywordType eq "COMPANY_NAME"}'>selected="selected"</c:if>>업체명</option>
	                                       <option value="SERIAL" <c:if test='${keywordType eq "SERIAL"}'>selected="selected"</c:if>>사업자등록번호</option>
		                                </select>
					              		</div>
					              		<div class="col-8 pl-0">
					              			<div class="input-group">
							                	<input type="text" id="keyword" name="keyword" placeholder="검색어" class="form-control" value="${search}" onkeypress="JavaScript:press(this.form)">
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
                                    <c:if test="${sellerPagenation.getList().size() ne 0}">
                                        <thead>
                                        </thead>
                                        <tbody>
                                       		<c:forEach var="seller" items="${sellerPagenation.getList()}">
											<tr class="tr-shadow" onclick="location.href='admin-seller-manage/${seller.getUSER_ID()}?prevPage=${sellerPagenation.getPage()}${keywordTypeUrl}${keywordUrl}${sortUrl}'" style="cursor:pointer;">
                                        		<td>
                                        			<div class="row p-2">
                                        				<div class="col-sm-12 col-md-12 col-lg-6 p-1">
                                        					<h5>${seller.getUSER_ID()}</h5><span>${seller.getEMAIL()}</span>
                                        				</div>
                                        				<div class="col-sm-12 col-md-12 col-lg-6 p-1">
                                        					<strong>판매자 상태</strong><br>
                                    						<c:choose>
			                                           		<c:when test="${seller.getSTATUS() eq 0}">
			                                           			<span style="color: gray; font-size: 16px;"><strong>미승인</strong></span>
			                                           		</c:when>
			                                           		<c:when test="${seller.getSTATUS() eq 1}">
			                                           			<span style="color: green; font-size: 16px;"><strong>승인</strong></span>
			                                           		</c:when>
			                                           		<c:when test="${seller.getSTATUS() eq 2}">
			                                           			<span style="color: red; font-size: 16px;"><strong>정지</strong></span>
			                                           		</c:when>
			                                           		<c:when test="${seller.getSTATUS() eq 3}">
			                                           			<span style="color: orange; font-size: 16px;"><strong>재승인 신청</strong></span>
			                                           		</c:when>
			                                           		<c:when test="${seller.getSTATUS() eq 4}">
			                                           			<span style="color: orangered; font-size: 16px;"><strong>재승인 거부</strong></span>
			                                           		</c:when>
			                                           		<c:when test="${seller.getSTATUS() eq 5}">
			                                           			<span style="color: black; font-size: 16px;"><strong>탈퇴</strong></span>
			                                           		</c:when>
			                                           		</c:choose>
                                        				</div>
                                        			</div>
                                        			<div class="row p-2">
                                        				<div class="col-sm-12 col-md-12 col-lg-6 p-1">
                                        					<div class="row p-2">
                                        						<div class="col-sm-12 col-md-6 col-lg-6 p-1">
                                        							<strong>이름</strong><br>${seller.getUSER_NAME()}
                                        						</div>
                                        						<div class="col-sm-12 col-md-6 col-lg-6 p-1">
                                        							<strong>가입일자</strong><br>${seller.getJOINDATE()}
                                        						</div>
                                        					</div>
                                        				</div>
                                        				<div class="col-sm-12 col-md-12 col-lg-6 p-1">
                                        					<div class="row p-2">
                                        						<div class="col-sm-12 col-md-6 col-lg-6 p-1">
                                        							<strong>사업자 등록 번호</strong><br>${seller.getSERIAL()}
                                        						</div>
                                        						<div class="col-sm-12 col-md-6 col-lg-6 p-1">
                                        							<strong>조회 결과</strong><br>${seller.getSERIAL_RESULT()}
                                        						</div>
                                        					</div>
                                        				</div>
<!--                                         				<div class="col-sm-12 col-md-12 col-lg-12 p-1"> -->
<!--                                         					<div class="row p-2"> -->
<!--                                         						<div class="col-sm-12 col-md-6 col-lg-6 p-1"> -->
<!--                                          							버튼 -->
<!--                                          						</div> -->
<!--                                         					</div> -->
<!--                                         				</div> -->
                                        			</div>
                                        		</td>
                                        	</tr>
                                            <tr class="spacer"></tr>
                                            </c:forEach>
                                        </tbody>
                                    </c:if>
	                                <c:if test="${sellerPagenation.getList().size() eq 0}">
	                               		검색 결과가 없습니다.
	                               	</c:if>
                                    </table>
                                </div>
                                <!-- 페이지네이션 시작 -->
                                <div class="row text-center p-3">
									<div style="float:none; margin:0 auto">
		                                 <ul class="pagination">
											<c:if test="${fn:length(sellerPagenation.getList()) > 0}">
												<c:choose>
													<c:when test="${sellerPagenation.startPage eq 1}">
														<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">이전</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item"><a class="page-link" href="/rudisfarm/admin/admin-seller-manage?page=${sellerPagenation.startPage-1}${keywordTypeUrl}${keywordUrl}${sortUrl}">이전</a></li>
													</c:otherwise>
												</c:choose>
												<c:forEach var="currentPage" begin="${sellerPagenation.startPage}" end="${sellerPagenation.endPage}">
													<c:choose>
														<c:when test="${currentPage eq sellerPagenation.page}">
															<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">${currentPage}</a></li>
														</c:when>
														<c:otherwise>
															<li class="page-item"><a class="page-link" href="/rudisfarm/admin/admin-seller-manage?page=${currentPage}${keywordTypeUrl}${keywordUrl}${sortUrl}">${currentPage}</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												
												<c:choose>
													<c:when test="${sellerPagenation.endPage eq sellerPagenation.maxPage}">
														<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">다음</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item"><a class="page-link" href="/rudisfarm/admin/admin-seller-manage?page=${sellerPagenation.endPage+1}${keywordTypeUrl}${keywordUrl}${sortUrl}">다음</a>
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