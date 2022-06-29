<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"/>
		<link rel="shortcut icon" href="images/favicon.ico"/>
<!-- 		<title>RudisFarm 결제 완료</title> -->

		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" type="text/css" media="all"/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/font-awesome.min.css" type="text/css" media="all" />
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/ionicons.min.css" type="text/css" media="all" />
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/owl.carousel.css" type="text/css" media="all"/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/owl.theme.css" type="text/css" media="all"/>
		<link rel='stylesheet' href='<%= request.getContextPath() %>/resources/bootstrap/css/prettyPhoto.css' type='text/css' media='all'/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/style.css" type="text/css" media="all"/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/custom.css" type="text/css" media="all"/>
		<link href="//fonts.googleapis.com/css?family=Great+Vibes%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet"/>
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
<title>리뷰 수정</title>

<style>
.starR{
  background: url('<%= request.getContextPath() %>/resources/images/star.png') no-repeat right 0;
  background-size: auto 100%;
  width: 70px;
  height: 70px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer; //안눌렀을때는 오른쪽부터 30만큼만 보여줌
}
.starR.on{background-position:0 0;} //눌렀을때는 왼쪽부터 30만큼만 보여줌

#multiple-container {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
}

.image {
    display: block;
    width: 100%;
}
.image-label {
    position: relative;
    bottom: 22px;
    left: 5px;
    color: white;
    text-shadow: 2px 2px 2px black;
}

</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if(${orders.PRODUCT_RATING}==1){
		$("#p1").click();
	} else if(${orders.PRODUCT_RATING}==2){
		$("#p2").click();
	} else if(${orders.PRODUCT_RATING}==3){
		$("#p3").click();
	} else if(${orders.PRODUCT_RATING}==4){
		$("#p4").click();
	} else if(${orders.PRODUCT_RATING}==5){
		$("#p5").click();
	}
	if(${orders.SELLER_RATING}==1){
		$("#s1").click();
	} else if(${orders.SELLER_RATING}==2){
		$("#s2").click();
	} else if(${orders.SELLER_RATING}==3){
		$("#s3").click();
	} else if(${orders.SELLER_RATING}==4){
		$("#s4").click();
	} else if(${orders.SELLER_RATING}==5){
		$("#s5").click();
	}
});
$(document).on("click", "#reviewSubmit", function(){
	if($("#PRODUCT_RATING").val()==""||$("#SELLER_RATING").val()==""){
	alert("별점을 주세요.");
	}
	console.log($('#FILES').val());
});
$(document).on("click", ".starRev-product span", function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  console.log($(this).text());

	  if($(this).text()=="1"){
		  $("#pr").html("&nbsp;&nbsp;"+$(this).text()+"점 : 매우 별로에요.");
	  } else if($(this).text()=="2"){
		  $("#pr").html("&nbsp;&nbsp;"+$(this).text()+"점 : 별로에요.");
	  } else if($(this).text()=="3"){
		  $("#pr").html("&nbsp;&nbsp;"+$(this).text()+"점 : 보통이에요.");
	  } else if($(this).text()=="4"){
		  $("#pr").html("&nbsp;&nbsp;"+$(this).text()+"점 : 마음에 들어요.");
	  } else if($(this).text()=="5"){
		  $("#pr").html("&nbsp;&nbsp;"+$(this).text()+"점 : 매우 마음에 들어요.");
	  }
	  $("#PRODUCT_RATING").val($(this).text());
	  console.log("product:"+$("#PRODUCT_RATING").val());
	  
	  //return false;
	});
$(document).on("click", ".starRev-seller span", function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  console.log($(this).text());
	  
	  if($(this).text()=="1"){
		  $("#sr").html("&nbsp;&nbsp;"+$(this).text()+"점 : 매우 별로에요.");
	  } else if($(this).text()=="2"){
		  $("#sr").html("&nbsp;&nbsp;"+$(this).text()+"점 : 별로에요.");
	  } else if($(this).text()=="3"){
		  $("#sr").html("&nbsp;&nbsp;"+$(this).text()+"점 : 보통이에요.");
	  } else if($(this).text()=="4"){
		  $("#sr").html("&nbsp;&nbsp;"+$(this).text()+"점 : 마음에 들어요.");
	  } else if($(this).text()=="5"){
		  $("#sr").html("&nbsp;&nbsp;"+$(this).text()+"점 : 매우 마음에 들어요.");
	  }
	  $("#SELLER_RATING").val($(this).text());
	  console.log("seller:"+$("#SELLER_RATING").val());
	  //return false;
	});
</script>

<script type="text/javascript">
$(document).on("change", "#FILES", function(){
	console.log("hi");
//var pullfiles=function(){
    // love the query selector
    var fileInput = document.querySelector("#FILES");
    console.log(fileInput);
    var files = fileInput.files;
    console.log(files);
    // cache files.length
    var fl = files.length;
    var i = 0;

    while ( i < fl) {
        // localize file var in the loop
        var file = files[i];
        alert(file.name);
        console.log(this);
        i++;
    }
//}
});
// set the input element onchange to call pullfiles
//document.querySelector("#files").onchange=pullfiles;

//a.t
</script>
<script type="text/javascript">
$(function() {
	$('#reviewSubmit').click(function() {
		console.log("버튼 클릭");
		
		var formData = new FormData($('#reviewForm')[0]);
		
		console.log(formData);
		
		$.ajax({
			type: 'post',
			url: '/rudisfarm/buyer-updatereview/'+$('#REVIEW_ID').val(),
			enctype: 'multipart/form-data',
			processData: false,
			contentType: false,
			cache: false,
			data: formData, 
			success: function(data) {
				if(data.resultCode == 1) {
					alert("리뷰가 수정되었습니다.");
					location.href = "/rudisfarm/my-page/reviewlist";
				} else {
					alert("리뷰 수정에 실패했습니다. 다시 시도해주세요.");
				}
			},
			error: function(e) {
				console.log("에러 발생!");
				console.log(e);
			}
		});
	});
})
</script>
<jsp:include page="/resources/bootstrap/commons/head.jsp"/>
</head>
<body>
		<jsp:include page="/resources/bootstrap/commons/mobile_menu.jsp"/>
		<div class="site">
			<jsp:include page="/resources/bootstrap/commons/topbar.jsp"/>
			<jsp:include page="/resources/bootstrap/commons/header.jsp"/>
			<div id="main">
				<div class="section section-bg-10 pt-11 pb-17">
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<h2 class="page-title text-center">리뷰 수정</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="section border-bottom pt-2 pb-2">
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<ul class="breadcrumbs">
									<li><a href="/rudisfarm">메인</a></li>
									<li><a href="/rudisfarm/my-page/reviewlist">리뷰 목록</a></li>
									<li>리뷰 수정</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="section pt-7 pb-7">
					<div class="container">
						<div class="row">
							<div class="col-md-9 col-md-push-3">
										<div class="commerce-tabs tabs classic">
<!-- 											<ul class="nav nav-tabs tabs"> -->
<!-- 												<li class=""> -->
<!-- 													<a data-toggle="tab" href="#tab-description" aria-expanded="false">상세보기</a> -->
<!-- 												</li> -->
<!-- 												<li class="active"> -->
<!-- 													<a data-toggle="tab" href="#tab-reviews" aria-expanded="true">리뷰</a> -->
<!-- 												</li> -->
<!-- 											</ul> -->
											<div class="tab-content">
<!-- 												<div class="tab-pane fade" id="tab-description"> -->
													
														
															
<!-- 																<img src="/rudisfarm/resources/upload/images/product/10/files" alt="" style="min-width:100%; min-height:100%;"> -->
															
														
														
													
<!-- 													<h3>상품 소개</h3>  -->
<!-- 													<p>description</p> -->
<!-- 												</div> -->
												<div id="tab-reviews" class="tab-pane fade active in">
												<div class="row">
												<div class="col-md-6">
													<div class="starRev-product">
												<h2 class="comment-title">상품 별점</h2><br>
												<div id="pr" style="font-size:20px; color:red"></div><br>
											  <span id="p1" class="starR">1</span>
											  <span id="p2" class="starR">2</span>
											  <span id="p3" class="starR">3</span>
											  <span id="p4" class="starR">4</span>
											  <span id="p5" class="starR">5</span>
											<!--   <span class="starR">별6</span> -->
											<!--   <span class="starR">별7</span> -->
											<!--   <span class="starR">별8</span> -->
											<!--   <span class="starR">별9</span> -->
											<!--   <span class="starR">별10</span> -->
											</div>
											</div>
											
											<div class="col-md-6">
											<div id="tab-reviews" class="tab-pane fade active in">
											
													<div class="starRev-seller">
												<h2 class="comment-title">판매자 별점</h2><br>
												<div id="sr" style="font-size:20px; color:red"></div><br>
											  <span id="s1" class="starR">1</span>
											  <span id="s2" class="starR">2</span>
											  <span id="s3" class="starR">3</span>
											  <span id="s4" class="starR">4</span>
											  <span id="s5" class="starR">5</span>
											<!--   <span class="starR">별6</span> -->
											<!--   <span class="starR">별7</span> -->
											<!--   <span class="starR">별8</span> -->
											<!--   <span class="starR">별9</span> -->
											<!--   <span class="starR">별10</span> -->
											</div>
											</div>
											<br><br><br>
											</div>
											
											
											
											
<!-- 											<strong>리뷰 등록</strong><br><br> -->

<!-- 	<form action="" method="post"> -->
	
<!-- 		<label for="content">리뷰 내용<strong style="color: red">*</strong><br> -->
<!-- 		<textarea id="content" name="content" placeholder="Review" required -->
<!-- 			maxlength="1000" autofocus="autofocus" rows="5" cols="33"></textarea></label><br><br> -->
		
<!-- 		<label for="files">사진 -->
<!-- 		<input type="file" id="files" name="files" maxlength="101" accept="image/*" multiple> onchange="console.log(this.value)"</label><br><br> -->

<!-- 		<small><strong style="color:red">*</strong>표시는 필수 입력란입니다.</small><br><br> -->
		
<!-- 		<button type="submit" style="float: right"> -->
<!-- 			<i class="fa fa-check"></i> 등록하기 -->
<!-- 		</button> -->
		
<!-- 		<button type="reset" class="btn btn-danger btn-sm"	onclick=""> -->
<!-- 			<i class="fa fa-ban"></i> 등록 취소 -->
<!-- 		</button> -->
		

<!-- 	</form> -->
													<form id="reviewForm" enctype="multipart/form-data">
														<input type="hidden" name="REVIEW_ID" id="REVIEW_ID" value="${orders.REVIEW_ID }">
														<input type="hidden" name="PRODUCT_ID" id="PRODUCT_ID" value="${orders.PRODUCT_ID }"><!-- value 임시 -->
<%-- 														오더스 프로덕트아이디${orders.PRODUCT_ID } --%>
<!-- 														<input type="text" name="CONTENT" value="내용"/> -->
<!-- 														<input type="hidden" name="PRODUCT_RATING" id="PRODUCT_RATING"> -->
<!-- 														<input type="hidden" name="SELLER_RATING" id="SELLER_RATING"> -->
<!-- 														<input type="file" id="reviewfiles" name="reviewfiles" multiple> -->
													
											
													
														
															
														
															
																<div class="col-md-12">
																<h3 class="comment-title">리뷰 수정</h3>
																	<label>리뷰 내용</label>
																	<textarea id="CONTENT" name="CONTENT" rows="5" placeholder="Review" required maxlength="1000" style="width:100%;">${orders.CONTENT }</textarea>
																</div>
															
															
																<div class="col-md-12">
															<label>상품 사진<br><br>
															<input type="file" id="reviewfiles" name="reviewfiles" accept="image/*" multiple></label><br><br>
															<input type="hidden" name="PRODUCT_RATING" id="PRODUCT_RATING">
															<input type="hidden" name="SELLER_RATING" id="SELLER_RATING">
															<div id="multiple-container"></div>
															 </div>
															</form>
															
<!-- 															<br><small><strong style="color:red">*</strong>표시는 필수 입력란입니다.</small><br> -->
															
																
<!-- 																<div class="col-md-4"> -->
<!-- 																	<input id="email" name="email" type="email" value="" size="30" placeholder="Email *" class="mb-2"> -->
<!-- 																</div> -->
<!-- 																<div class="col-md-4"> -->
<!-- 																	<input id="url" name="url" type="text" value="" placeholder="Website"> -->
<!-- 																</div> -->
															
															
															
															
																<div class="col-md-12">
																			<button type="button"  id="reviewSubmit" style="float: right">
																			<i class="fa fa-check"></i> 수정하기
																		</button>
																		
																		<button type="reset" class="btn btn-danger btn-sm"	onclick="location.href='/rudisfarm/my-page/orders'">
																			<i class="fa fa-ban"></i> 등록 취소
																		</button>
																</div>
															
													</div>
												</div>
											</div>
										</div>

									</div>
							
							
							<!-- 사이드바 -->
							<div class="col-md-3 col-md-pull-9"> 
								<div class="sidebar">
									<div class="widget widget-product-categories">
										<h3 class="widget-title">MY 쇼핑</h3>
										<ul class="product-categories">
											<li><a href="/rudisfarm/my-page/orders">주문 목록 </a></li>
											<li><a href="/rudisfarm/my-page/my-cart">찜 목록</a></li>
										</ul>
										<br>
										<h3 class="widget-title">MY 활동</h3>
										<ul class="product-categories">
											<li><a href="/rudisfarm/my-page/reviewlist">리뷰 목록</a></li>
										</ul>
										<br>
										<h3 class="widget-title">MY 정보</h3>
										<ul class="product-categories">
											<li><a href="/rudisfarm/my-page/my-info-modify-form">개인정보 조회/수정</a></li>
											<li><a href="/rudisfarm/my-page/out-check">회원 탈퇴</a></li>
										</ul>
									</div>
								</div>
							</div>
							<!-- 사이드바 -->
							
							
						</div> <!-- row -->
					</div>
				</div>
			</div>
			<jsp:include page="/resources/bootstrap/commons/footer.jsp"/>
		</div>
		

		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery-migrate.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/modernizr-2.7.1.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/owl.carousel.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery.countdown.min.js"></script>
		<script type='text/javascript' src='<%= request.getContextPath() %>/resources/bootstrap/js/jquery.prettyPhoto.js'></script>
		<script type='text/javascript' src='<%= request.getContextPath() %>/resources/bootstrap/js/jquery.prettyPhoto.init.min.js'></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/script.js"></script>
		<script>
function readMultipleImage(input) {
    const multipleContainer = document.getElementById("multiple-container")
    $('.column').text(' ');
    // 인풋 태그에 파일들이 있는 경우
    if(input.files) {
        // 이미지 파일 검사 (생략)
        console.log(input.files)
        // 유사배열을 배열로 변환 (forEach문으로 처리하기 위해)
        const fileArr = Array.from(input.files)
        const $colDiv1 = document.createElement("div")
        const $colDiv2 = document.createElement("div")
        $colDiv1.classList.add("column")
        $colDiv2.classList.add("column")
        fileArr.forEach((file, index) => {
            const reader = new FileReader()
            const $imgDiv = document.createElement("div")   
            const $img = document.createElement("img")
            $img.classList.add("image")
            const $label = document.createElement("label")
            $label.classList.add("image-label")
            $label.textContent = file.name
            $imgDiv.appendChild($img)
            $imgDiv.appendChild($label)
            reader.onload = e => {
                $img.src = e.target.result
                
                $imgDiv.style.width = "500px"
//                 $imgDiv.style.height = "500px"
            }
            
            console.log(file.name)
            if(index % 2 == 0) {
                $colDiv1.appendChild($imgDiv)
            } else {
                $colDiv2.appendChild($imgDiv)
            }
            
            reader.readAsDataURL(file);
        })
        multipleContainer.appendChild($colDiv1);
        multipleContainer.appendChild($colDiv2);
    }
}

const inputMultipleImage = document.getElementById("reviewfiles")
inputMultipleImage.addEventListener("change", e => {
    readMultipleImage(e.target)
})
</script>
		
</body>
</html>