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
    <title>리뷰 목록 관리</title>

    <!-- Fontfaces CSS-->
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/css/font-face.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/css/theme.css" rel="stylesheet" media="all">

	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).keydown(function() {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		    $("#search").click();
		  }
		});
	</script>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#search").click(function() {
		if($("input:text").val()!=""){
		var a=$("input:text").val();
		var b=$("."+a);
		var c=b.length;
		var d=b[0].childNodes[0].nodeValue;
		if($("input:text").val()==d.trim()) {
			console.log("성공");
			console.log(c);
			for(var i=0;i<c;i++){
				console.log("hi");
			}
			$("tr.tr-shadow").attr('style', "display:none");
			$("tr.tr-shadow").next().attr('style', "display:none");
			console.log(b.parent());
			b.parent().attr('style', "display:");
		} else{
			console.log("실패");
		}
		} else{
			$("tr.tr-shadow").attr('style', "display:");
		}
		});
	});
	</script>
	<script type="text/javascript">
		$(function() {
			$('#sort').change(function() {
				location.href='/rudisfarm/seller/seller-reviewlist-manage?sort='+$(this).val();
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
								<!-- DATA TABLE -->
								<h3 class="title-5 m-b-35">리뷰 목록</h3>
								<form action="/rudisfarm/seller/seller-reviewlist-manage">
						            <div class="row">
	                                  <div class="col-sm-12 col-md-3 col-lg-3">
	                                    <select name="sort" id="sort" class="form-control">
		                                   <option value="WRITEDATE" <c:if test='${sort eq "WRITEDATE"}'>selected="selected"</c:if>>작성일순</option>
	                                       <option value="USER_ID" <c:if test='${sort eq "USER_ID"}'>selected="selected"</c:if>>유저 아이디순</option>
	                                       <option value="PRODUCT_ID" <c:if test='${sort eq "PRODUCT_ID"}'>selected="selected"</c:if>>상품 아이디순</option>
		                                </select>
						              </div>
						              <div class="col-sm-12 col-md-9 col-lg-9">
						              <div class="row">
						              	<div class="col-4 pr-0">
					              			<select name="keywordType" id="keywordType" class="form-control">
		                                       <option value="WRITEDATE" <c:if test='${keywordType eq "WRITEDATE"}'>selected="selected"</c:if>>작성일</option>
	                                       	   <option value="USER_ID" <c:if test='${keywordType eq "USER_ID"}'>selected="selected"</c:if>>유저 아이디</option>
	                                       	   <option value="PRODUCT_ID" <c:if test='${keywordType eq "PRODUCT_ID"}'>selected="selected"</c:if>>상품 아이디</option>
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
								<div class="table-responsive table-responsive-data2">
								<table class="table table-data2">
                                    <c:if test="${reviewPagenation.getList().size() ne 0}">
                                        <thead>
                                        </thead>
                                        <tbody>
                                       		<c:forEach var="review" items="${reviewPagenation.getList()}">
											<tr class="tr-shadow" onclick="location.href='seller-review-manage/${review.REVIEW_ID}'" style="cursor: pointer">
                                        		<td>
                                        			<div class="row p-2">
                                        				<div class="col-sm-12 col-md-12 col-lg-6 p-1">
                                        					<h5>리뷰 아이디 : ${review.getREVIEW_ID()}</h5>
                                        				</div>
<!--                                         				<div class="col-sm-12 col-md-12 col-lg-6 p-1"> -->
<!--                                         					<strong>판매자 상태</strong><br> -->
<%--                                     						<c:choose> --%>
<%-- 			                                           		<c:when test="${review.getSTATUS() eq 0}"> --%>
<!-- 			                                           			<span style="color: gray; font-size: 16px;"><strong>미승인</strong></span> -->
<%-- 			                                           		</c:when> --%>
<%-- 			                                           		<c:when test="${review.getSTATUS() eq 1}"> --%>
<!-- 			                                           			<span style="color: green; font-size: 16px;"><strong>승인</strong></span> -->
<%-- 			                                           		</c:when> --%>
<%-- 			                                           		<c:when test="${review.getSTATUS() eq 2}"> --%>
<!-- 			                                           			<span style="color: red; font-size: 16px;"><strong>정지</strong></span> -->
<%-- 			                                           		</c:when> --%>
<%-- 			                                           		<c:when test="${review.getSTATUS() eq 3}"> --%>
<!-- 			                                           			<span style="color: orange; font-size: 16px;"><strong>재승인 신청</strong></span> -->
<%-- 			                                           		</c:when> --%>
<%-- 			                                           		<c:when test="${review.getSTATUS() eq 4}"> --%>
<!-- 			                                           			<span style="color: orangered; font-size: 16px;"><strong>재승인 거부</strong></span> -->
<%-- 			                                           		</c:when> --%>
<%-- 			                                           		<c:when test="${review.getSTATUS() eq 5}"> --%>
<!-- 			                                           			<span style="color: black; font-size: 16px;"><strong>탈퇴</strong></span> -->
<%-- 			                                           		</c:when> --%>
<%-- 			                                           		</c:choose> --%>
<!--                                         				</div> -->
                                        			</div>
                                        			<div class="row p-2">
                                        				<div class="col-sm-12 col-md-12 col-lg-6 p-1">
                                        					<div class="row p-3">
                                        						<div class="col-sm-12 col-md-4 col-lg-4 p-1">
                                        							<strong>유저 아이디</strong><br>${review.getUSER_ID()}
                                        						</div>
                                        						<div class="col-sm-12 col-md-4 col-lg-4 p-1" onclick="event.cancelBubble=true; location.href='/rudisfarm/seller/seller-product-manage/${review.PRODUCT_ID}'" style="cursor:pointer; color:red">
                                        							<strong>상품 아이디</strong><br>${review.getPRODUCT_ID()}
                                        						</div>
                                        						<div class="col-sm-12 col-md-4 col-lg-4 p-1" onclick="event.cancelBubble=true; location.href='/rudisfarm/seller/seller-product-manage/${review.PRODUCT_ID}'" style="cursor:pointer; color:red">
                                        							<strong>상품명</strong><br>${review.getPRODUCT_NAME()}
                                        						</div>
                                        					</div>
                                        				</div>
                                        				<div class="col-sm-12 col-md-12 col-lg-6 p-1">
                                        					<div class="row p-2">
                                        						<div class="col-sm-12 col-md-6 col-lg-6 p-1">
                                        							<strong>상품 별점</strong><br>${review.getPRODUCT_RATING()}&nbsp;&nbsp;
                                        							<strong style="color:blue">
                                        							<c:choose>
																		<c:when test="${review.getPRODUCT_RATING() == '1'}">★☆☆☆☆</c:when>
																		<c:when test="${review.getPRODUCT_RATING() == '2'}">★★☆☆☆</c:when>
																		<c:when test="${review.getPRODUCT_RATING() == '3'}">★★★☆☆</c:when>
																		<c:when test="${review.getPRODUCT_RATING() == '4'}">★★★★☆</c:when>
																		<c:when test="${review.getPRODUCT_RATING() == '5'}">★★★★★</c:when>
																	</c:choose></strong>
                                        						</div>
                                        						<div class="col-sm-12 col-md-6 col-lg-6 p-1">
                                        							<strong>판매자 별점</strong><br>${review.getSELLER_RATING()}&nbsp;
                                        							<strong style="color:blue">
                                        							<c:choose>
																		<c:when test="${review.getSELLER_RATING() == '1'}">★☆☆☆☆</c:when>
																		<c:when test="${review.getSELLER_RATING() == '2'}">★★☆☆☆</c:when>
																		<c:when test="${review.getSELLER_RATING() == '3'}">★★★☆☆</c:when>
																		<c:when test="${review.getSELLER_RATING() == '4'}">★★★★☆</c:when>
																		<c:when test="${review.getSELLER_RATING() == '5'}">★★★★★</c:when>
																	</c:choose></strong>
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
                                        			<div class="col-sm-12 col-md-12 col-lg-12 p-1">
                                        					<div class="row p-1">
                                        					<div class="col-sm-12 col-md-12 col-lg-6 p-1">
                                       							<strong>리뷰 내용</strong><br>&nbsp; 
																<c:choose>
																	<c:when test="${review.CONTENT.length() gt 100}">
																		${fn:substring(review.CONTENT, 0, 30) }...
																	</c:when>
																	<c:otherwise>
																		${review.CONTENT}
																	</c:otherwise>
																</c:choose>
																</div>
                                        					</div>
                                       					</div>
                                        		</td>
                                        	</tr>
                                            <tr class="spacer"></tr>
                                            </c:forEach>
                                        </tbody>
                                    </c:if>
	                                <c:if test="${reviewPagenation.getList().size() eq 0}">
	                               		검색 결과가 없습니다.
	                               	</c:if>
                                    </table>
								</div>
								<div class="row text-center p-3">
									<div style="float:none; margin:0 auto">
		                                 <ul class="pagination">
											<c:if test="${fn:length(reviewPagenation.getList()) > 0}">
												<c:choose>
													<c:when test="${reviewPagenation.startPage eq 1}">
														<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">이전</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item"><a class="page-link" href="/rudisfarm/seller/seller-reviewlist-manage?page=${reviewPagenation.startPage-1}${keywordTypeUrl}${keywordUrl}${sortUrl}">이전</a></li>
													</c:otherwise>
												</c:choose>
												<c:forEach var="currentPage" begin="${reviewPagenation.startPage}" end="${reviewPagenation.endPage}">
													<c:choose>
														<c:when test="${currentPage eq reviewPagenation.page}">
															<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">${currentPage}</a></li>
														</c:when>
														<c:otherwise>
															<li class="page-item"><a class="page-link" href="/rudisfarm/seller/seller-reviewlist-manage?page=${currentPage}${keywordTypeUrl}${keywordUrl}${sortUrl}">${currentPage}</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												
												<c:choose>
													<c:when test="${reviewPagenation.endPage eq reviewPagenation.maxPage}">
														<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">다음</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item"><a class="page-link" href="/rudisfarm/seller/seller-reviewlist-manage?page=${sellerPagenation.endPage+1}${keywordTypeUrl}${keywordUrl}${sortUrl}">다음</a>
													</c:otherwise>
												</c:choose>
											</c:if>
									    </ul> 
									</div>
								</div>
								<!-- END DATA TABLE -->
								<br>
<!-- 								<button class="btn btn-danger btn-sm" onclick="abc()" -->
<!-- 									style="float: right"> -->
<!-- 									<i class="fa fa-trash"></i> 삭제 -->
<!-- 								</button> -->
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