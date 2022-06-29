<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0" />
<link rel="shortcut icon" href="images/favicon.ico" />
<title>RudisFarm 유저 주문 상세내역 리스트</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css"
	type="text/css" media="all" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/font-awesome.min.css"
	type="text/css" media="all" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/ionicons.min.css"
	type="text/css" media="all" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/owl.carousel.css"
	type="text/css" media="all" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/owl.theme.css"
	type="text/css" media="all" />
<link rel='stylesheet'
	href='<%=request.getContextPath()%>/resources/bootstrap/css/prettyPhoto.css'
	type='text/css' media='all' />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/style.css"
	type="text/css" media="all" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/custom.css"
	type="text/css" media="all" />
<link
	href="//fonts.googleapis.com/css?family=Great+Vibes%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
         <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
         <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
<script type="text/javascript">
function exchangeNcancelCheck(id, code, msg) {
   if(confirm(code+"신청하시겠습니까?")) {
	   
	   if($('#msg').val() == '') {
		   alert("사유를 입력해주세요.");
		   return;
	   }
	   
	   $.ajax({
			type: 'put',
			url: '/rudisfarm/my-page/my-exchange-and-cancel/'+id, 
			dataType: 'json',
			contentType: "application/json; charset=utf-8;",
			data: JSON.stringify({
					code: code,
					msg: $('#msg').val()
				}),
			success: function(data) {
				if(data) {
					alert("성공적으로 "+code+"신청이 되었습니다.");
					location.href = '/rudisfarm/my-page/orders/'+id;
				} else {
					alert(code+"신청이 실패하였습니다.");
				}
			},
			error: function(e) {
				console.log("에러 발생!");
				console.log(e);
			}
		});
    } 
    
}
</script>
     
</head>
<body>
	<jsp:include page="/resources/bootstrap/commons/mobile_menu.jsp" />
		<jsp:include page="/resources/bootstrap/commons/header.jsp" />
	
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<h2 class="page-title text-center">my-orders-detail</h2>
						</div>
					</div>
				</div>
			<div class="section border-bottom pt-2 pb-2">
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<ul class="breadcrumbs">
							<li><a href="/rudisfarm">메인 페이지</a></li>
								<li><a href="/rudisfarm/my-page/orders">내 주문목록</a></li>
									<li><a href="/rudisfarm/my-page/orders/${ORDERS_ID}">내 주문 상세내역</a></li>
								<li>교환/반품 페이지</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- MAIN CONTENT-->
			<div class="container">
					<div class="row">
						<div class="col-sm-12">
			<div class="user-data m-b-30">
						<h3 class="title-3 m-b-30">
							<i class="zmdi zmdi-account-calendar"></i>교환/반품 신청
						</h3>
						<br>
						<br>
						<div style="float: left; font-weight: bold; ">요청사유</div>
				<table class="table">
							
						
						<tr>
							<td style="font-family: 돋음; font-size: 12;">
								
							</td>
							<td><textarea id="msg" name="msg"
									class="form-control" cols="67" rows="15" maxlength="650"
									required="required"></textarea></td>
						</tr>
						<!-- <tr>
							<td style="font-family: 돋음; font-size: 12;">
								<div align="center">파일 첨부</div>
							</td>
							<td><input name="reviewboard_file" type="file" /></td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr> -->
						<tr align="center" valign="middle">
							<td colspan="5">
							<button type="button" class="au-btn au-btn-load"
								onclick="exchangeNcancelCheck(${exchangeCancel.ORDERS_ID}, '교환')">교환신청</button>&nbsp;
								<button type="button" class="au-btn au-btn-load"
									onclick="exchangeNcancelCheck(${exchangeCancel.ORDERS_ID}, '반품')">반품신청</button>&nbsp;
								<button class="au-btn au-btn-load"
									onclick="location.href='/rudisfarm/my-page/orders'">목록으로</button>&nbsp;
									
                                              
							</td>
						</tr>
				</table>
			</div>
		</div>
	</div>
	</div>
	<br>
	<br>
	
	<!-- footer-->
	<jsp:include page="/resources/bootstrap/commons/footer.jsp" />


	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/add-cart.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/categori-header.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/cart-list.js"></script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery-migrate.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/bootstrap/js/modernizr-2.7.1.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/bootstrap/js/owl.carousel.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery.countdown.min.js"></script>
	<script type='text/javascript'
		src='<%=request.getContextPath()%>/resources/bootstrap/js/jquery.prettyPhoto.js'></script>
	<script type='text/javascript'
		src='<%=request.getContextPath()%>/resources/bootstrap/js/jquery.prettyPhoto.init.min.js'></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/bootstrap/js/script.js"></script>
</body>
</html>
