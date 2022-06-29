<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <title>판매자 상품 등록</title>

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
	<script>
		$(function() {
			$("#productAddButton").click(function(event) {
				event.preventDefault();
				
				if($('#PRODUCT_NAME').val()=="") {
					alert('제목을 입력해 주십시오.'); 
					return false;
				}
				
				var price = uncomma(document.getElementById('PRICE').value);
				var weight = document.getElementById('WEIGHT').value;
				var count = document.getElementById('COUNT').value;
				
				if(0 == price.charAt(0) || price=="") {
					alert("가격을 확인해 주십시오.");
					return false;
				}
				
				if(price > 100000 || price < 0) {
					alert('100,000원 이하 단위로 설정하실수 있습니다.'); 
					return false;
				}
				
				if(0 == weight.charAt(0) || weight < 0 || weight > 100000) {
					alert('무게(판매단위)를 확인해 주십시오.'); 
					return false;
				}
				
				if(0 == count.charAt(0) || count=="" || count < 0 || count > 999) {
					alert('수량을 확인해 주십시오.'); 
					return false;
				}
				
				if($('input[name=TYPE1]').val()=="") {
					alert('대분류를 확인해 주십시오.'); 
					return false;
				}
				
				if($('input[name=TYPE2]').val()=="") {
					alert('소분류를 확인해 주십시오.'); 
					return false;
				}
				
				if($('input[name=thum-image]').val()=="") {
					alert('대표이미지를 선택해 주십시오.'); 
					return false;
				}
				
				if($('input[name=desc-image]').val()=="") {
					alert('설명이미지를 선택해 주십시오.'); 
					return false;
				}
				
				document.getElementById('PRICE').value = price;
				
				var formData = new FormData($('#addProductForm')[0]);
				
				$.ajax({
					type: 'post',
					url: 'seller-product-manage/0',
					enctype: 'multipart/form-data',
					processData: false,
					contentType: false,
					cache: false,
					data: formData, 
					success: function(data) {
						if(data) {
							console.log(data);
							console.log($('#PRICE').val());
							alert("등록에 성공했습니다.");
							location.href = "seller-product-manage";
						} else {
							alert("관리자에게 문의해 주시기 바랍니다.");
						}
					},
					error: function(e) {
						console.log("에러 발생!");
						console.log(e);
					}
				});
			});
		})
		
		 function uncomma(str) {
		     str = String(str);
		     return str.replace(/[^\d]+/g, '');
		 }
		 function inputNumberFormat(obj) {
		     obj.value = comma(uncomma(obj.value));
		 }
	
		 function comma(str) {
		     str = String(str);
		     return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		 }
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

	                            <div class="card">
	                                <div class="card-header" >
	                                    <strong>상품 등록</strong>
	                                </div>
	                                <div class="card-body card-block">
	                                    <form action="" method="post" enctype="multipart/form-data" class="form-horizontal" id="addProductForm">
	                                        <div class="row form-group">
	                                            <div class="col col-md-3">
	                                                <label class=" form-control-label">판매자</label>
	                                            </div>
	                                            <div class="col-12 col-md-9">
	                                                <p class="form-control-static"><strong>${USER_ID}</strong></p>
	                                            </div>
	                                            <input type="hidden" name="USER_ID" id="USER_ID" value="${USER_ID}">
	                                        </div>
	                                        <div class="row form-group">
	                                            <div class="col col-md-3">
	                                                <label class=" form-control-label">이름</label>
	                                            </div>
	                                            <div class="col-12 col-md-9">
	                                                <p class="form-control-static"><strong>${USER_NAME}</strong></p>
	                                            </div>
	                                        </div>	                                        
	                                        <div class="row form-group">
	                                            <div class="col col-md-3">
	                                                <label for="PRODUCT_NAME" class=" form-control-label">*상품 제목</label>
	                                            </div>
	                                            <div class="col-12 col-md-5">
	                                                <input type="text" name="PRODUCT_NAME" id="PRODUCT_NAME" placeholder="제목..." class="form-control" maxlength="30">
	                                                <small class="form-text text-muted">(30자 이내)</small>
	                                            </div>
	                                        </div>	                                        
	                                        <div class="row form-group">
	                                            <div class="col col-md-3">
	                                                <label for="PRICE" class=" form-control-label">*가격</label>
	                                            </div>
	                                            <div class="col-12 col-md-5">
	                                                <input type="text" id="PRICE" name="PRICE" placeholder="가격..." class="form-control" onkeyup="inputNumberFormat(this)">
	                                                <small class="form-text text-muted">100,000원 이하</small>
	                                            </div>
	                                        </div>
	                                        <div class="row form-group">
	                                            <div class="col col-md-3">
	                                                <label for="WEIGHT" class=" form-control-label">*판매 단위</label>
	                                            </div>
	                                            <div class="col-12 col-md-5">
	                                                <input type="text" name="WEIGHT" id="WEIGHT" placeholder="판매 단위..." class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
	                                                <small class="help-block form-text">100,000g 이하</small>
	                                            </div>
	                                        </div>
	                                        <div class="row form-group">
	                                            <div class="col col-md-3">
	                                                <label for="COUNT" class=" form-control-label">*수량</label>
	                                            </div>
	                                            <div class="col-12 col-md-5">
	                                                <input type="text" name="COUNT" id="COUNT" placeholder="수량..." class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
	                                            	<small class="help-block form-text">999개 이하</small>
	                                            </div>
	                                        </div>
	                                        <div class="row form-group">
	                                            <div class="col col-md-3">
	                                                <label for="DESCRIPTION" class=" form-control-label">상품 설명</label>
	                                            </div>
	                                            <div class="col-12 col-md-7">
	                                                <textarea name="DESCRIPTION" id="DESCRIPTION" cols="50" rows="10" placeholder="상품 설명 (1500자)..." class="form-control" style="resize: none;" wrap="hard" maxlength="1500"></textarea>
	                                            </div>									
	                                        </div>
	                                        <div class="row form-group">
	                                            <div class="col col-md-3">
	                                                <label for="select" class=" form-control-label">*대분류</label>
	                                            </div>
	                                            <div class="col-12 col-md-2">
	                                                <select name="select" id="TYPE1" class="form-control">
	                                                    <option value="">------</option>
	                                                </select>
	                                            </div>
	                                            <!-- formdata로 select된 값이 넘어가지않음 -->
	                                            <input type="hidden" name="TYPE1">
	                                        </div>
	                                        
	                                        <div class="row form-group">
	                                            <div class="col col-md-3">
	                                                <label for="select" class=" form-control-label">*소분류</label>
	                                            </div>
	                                            <div class="col-12 col-md-2">
	                                                <select name="select" id="TYPE2" class="form-control">
	                                                    <option value="">------</option>
	                                                </select>
	                                            </div>
	                                            <!-- formdata로 select된 값이 넘어가지않음 -->
	                                            <input type="hidden" name="TYPE2">
	                                        </div>
	                                        
	                                        <div class="row form-group">
	                                            <div class="col col-md-3">
	                                                <label for="thum-image" class=" form-control-label">대표 이미지</label>
	                                            </div>
	                                            <div class="col-12 col-md-9">
	                                                <input type="file" name="thum-image" id="thum-image" class="form-control-file" accept="image/*">
	                                            </div>
	                                        </div>
	                                        
	                                        <div class="row form-group">
	                                            <div class="col col-md-3">
	                                                <label for="desc-image" class=" form-control-label">설명 이미지</label>
	                                            </div>
	                                            <div class="col-12 col-md-9">
	                                                <input type="file" name="desc-image" id="desc-image" multiple="multiple" class="form-control-file" accept="image/*">
	                                                <small class="help-block form-text">6장까지 등록가능</small>
	                                            </div>
	                                        </div>
	                                    </form>
	                                </div>
	                                <div class="card-footer">
	                                    <button type="submit" class="btn btn-primary btn-sm" id="productAddButton">
	                                        <i class="fa fa-dot-circle-o"></i> 등록하기
	                                    </button>
	                                    <button type="reset" class="btn btn-danger btn-sm" onclick="location.href='/rudisfarm/seller/seller-product-manage'">
	                                        <i class="fa fa-ban"></i> 취소
	                                    </button>
	                                </div>
	                            </div>
                 		<!-- 여기까지 -->
                </div>
            </div>
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
        </div>

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
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/product-type.js?v=<%=System.currentTimeMillis()%>"></script>
</body>
</html>