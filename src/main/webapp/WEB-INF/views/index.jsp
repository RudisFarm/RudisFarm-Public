<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"/>
		<jsp:include page="/resources/bootstrap/commons/head.jsp"/>
		<link rel="shortcut icon" href="<%= request.getContextPath() %>/resources/bootstrap/images/favicon.ico"/>
		<title>RudisFarm &#8211; Homepage</title>

		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" type="text/css" media="all"/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/font-awesome.min.css" type="text/css" media="all" />
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/ionicons.min.css" type="text/css" media="all" />
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/owl.carousel.css" type="text/css" media="all"/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/owl.theme.css" type="text/css" media="all"/>
		<link rel='stylesheet' href='<%= request.getContextPath() %>/resources/bootstrap/css/prettyPhoto.css' type='text/css' media='all'/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/settings.css" type="text/css" media="all"/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/style.css" type="text/css" media="all"/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/custom.css" type="text/css" media="all"/>
		<link href="//fonts.googleapis.com/css?family=Great+Vibes%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet"/>
    	
	   	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	    <script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/comma.js"></script>
	    <script type="text/javascript">
	    
	    // Load the Visualization API and the piechart package.
	    google.charts.load('current', {'packages':['corechart']});
	      
	    // Set a callback to run when the Google Visualization API is loaded.
	    google.charts.setOnLoadCallback(drawChart);
	      
	    function drawChart(num) {
	   		if(num == null){
	    		numurl = "<%=request.getContextPath()%>/resources/json/fruit.json";
	   		} else if(num == '1'){
	   			numurl = "<%=request.getContextPath()%>/resources/json/fruit.json";
	   		} else if(num == '2'){
	   			numurl = "<%=request.getContextPath()%>/resources/json/food.json";
	   		} else if(num == '3'){
	   			numurl = "<%=request.getContextPath()%>/resources/json/vegetable.json";
	   		} else {
	   			numurl = "<%=request.getContextPath()%>/resources/json/mushroom.json";
	   		}
	      var jsonData = $.ajax({
	          url: numurl,
	          dataType: "json",
	          async: false
	   
	       
	          }).responseText;
	     
	          
	      // Create our data table out of JSON data loaded from server.
	      var data = new google.visualization.DataTable(jsonData);
	
	      // Instantiate and draw our chart, passing in some options.
	      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
	      chart.draw(data, {width: '100%', height: 350});
	      window.addEventListener('resize', drawChart, false);
	    }
	
	    </script>
	     <script>

	    	/* 프리미엄 상품 보기 */
		    	  $(function() {
			    		$.ajax({
			    			type : 'POST',
				    		url : '/rudisfarm/index-premiumproduct',
				    		dataType : 'json',
				    		contentType : 'application/json; charset=utf-8;',
				    		async: false,
				    		success : function(data) {
				    			console.log(data)
				    			var image="";
				    			$.each(data, function(index, key) {
				    				
				    				if(key["sumnail"] == "") { //썸네일이 없을 경우
				    					image="/rudisfarm/resources/upload/images/default.png";
				    				} else {
				    					image='"/rudisfarm/resources/upload/images/product/'+key["product_ID"]+'/'+key["sumnail"]+'"';
				    				}
				    				
				    				$('#indexPremiumProductDiv').append(
			    						'<div class="col-sm-4">'+
											'<div class="organik-about">'+
												'<div class="image style-2" data-bg-color="#f5e9e2">'+
												'<img src='+image+' alt="" style="min-width: 100%; height: 260px;" />'+
													'<div class="organik-about-letter">w</div>'+
												'</div>'+
												'<div class="content">'+
													'<h5>'+key["product_NAME"]+'</h5>'+
													'<p>'+comma(key["price"])+'원</p>'+
													'<p>'+comma(key["weight"]/1000.0)+'kg</p>'+
													'<a class="link" href="/rudisfarm/product/'+key["product_ID"]+'">'+
														'<i class="ion-plus-round"></i> 상세보기'+
													'</a>'+
												'</div>'+
											'</div>'+
										'</div>'
				    				);
			    			});
			    		},
			    		error : function(data) {
			    			console.log(data);
			    			console.log("에러 발생!");
			    		}
			    	});
		    	}) //프리미엄 상품 보기 
		    	
		    	
		    	/* 신규 상품 보기 */
		   			$(function() {
			    		$.ajax({
			    			type : 'POST',
				    		url : '/rudisfarm/index-newproduct',
				    		dataType : 'json',
				    		contentType : 'application/json; charset=utf-8;',
				    		async: false,
				    		success : function(data) {
				    			console.log(data)
				    			var image="";
				    			$.each(data, function(index, key) {
				    				
				    				if(key["sumnail"] == "") { //썸네일이 없을 경우
				    					image="/rudisfarm/resources/upload/images/default.png";
				    				} else {
				    					image='"/rudisfarm/resources/upload/images/product/'+key["product_ID"]+'/'+key["sumnail"]+'"';
				    				}
				    				
				    				$('#indexNewProductDiv').append(
				    					
			    						'<div class="product-item text-center">'+
											'<div class="product-thumb">'+
												'<a href="/rudisfarm/product/'+key["product_ID"]+'">'+
													'<img src='+image+' alt="" style="min-width: 100%; height: 300px;"/>'+
												'</a>'+
												'<div class="product-action">'+
													'<span class="add-to-cart">'+
														'<a href="javascript:void(0);" onclick="addCart('+key["product_ID"]+', 1,'+"'${USER_ID}'"+');" data-toggle="tooltip" data-placement="top" title="찜 하기"></a>'+
													'</span>'+
												'</div>'+
											'</div>'+
											'<div class="product-info">'+
												'<a href="/rudisfarm/product/'+key["product_ID"]+'">'+
													'<h2 class="title">'+key["product_NAME"]+'</h2>'+
													'<span class="price">'+
														'<ins>'+comma(key["price"])+'원</ins><br>'+
													'</span>'+
													'<span class="price" style="color:#FFA500">'+
														'<ins>'+comma(key["weight"]/1000.0)+'kg</ins>'+
													'</span><br>'+
													'<span class="price" style="color:#DF7401">'+
														'<ins>(수량 : '+key["count"]+')</ins>'+
													'</span>'+														
												'</a>'+
											'</div>'+
										'</div>'
				    				);
			    			});
			    		},
			    		error : function(data) {
			    			console.log(data);
			    			console.log("에러 발생!");
			    		}
			    	});
		    	}) //신규 상품 보기 */
		    	
		    	
		    	/* 랜덤 상품 보기 */
		    	$(function() {
			    		$.ajax({
			    			type : 'POST',
				    		url : '/rudisfarm/index-randomproduct',
				    		dataType : 'json',
				    		contentType : 'application/json; charset=utf-8;',
				    		async: false,
				    		success : function(data) {
				    			console.log(data)
				    			var image="";
				    			$.each(data, function(index, key) {
				    				
				    				if(key["sumnail"] == "") { //썸네일이 없을 경우
				    					image="/rudisfarm/resources/upload/images/default.png";
				    				} else {
				    					image='"/rudisfarm/resources/upload/images/product/'+key["product_ID"]+'/'+key["sumnail"]+'"';
				    				}
				    				
				    				$('#indexRandomProduct').append(
										'<div class="product-item text-center">'+
											'<div class="product-thumb">'+
												'<a href="/rudisfarm/product/'+key["product_ID"]+'">'+
													'<img src='+image+' alt="" style="min-width: 100%; height: 300px;"/>'+
												'</a>'+
												
												'<div class="product-action">'+
													'<span class="add-to-cart">'+
														'<a href="javascript:void(0);" onclick="addCart('+key["product_ID"]+', 1,'+"'${USER_ID}'"+');" data-toggle="tooltip" data-placement="top" title="찜 하기"></a>'+
													'</span>'+
												'</div>'+
											'</div>'+
											'<div class="product-info">'+
												'<a href="/rudisfarm/product/'+key["product_ID"]+'">'+
													'<h2 class="title">'+key["product_NAME"]+'</h2>'+
													'<span class="price">'+comma(key["price"])+'원</span><br>'+
													'<span class="price" style="color:#FFA500">'+
														'<ins>'+comma(key["weight"]/1000.0)+'kg</ins>'+
													'</span>'+
													'<span class="price" style="color:#DF7401"><br>'+
														'<ins>(수량 : '+key["count"]+')</ins>'+
													'</span>'+	
												'</a>'+
											'</div>'+
										'</div> '
				    				);
			    			});
			    		},
			    		error : function(data) {
			    			console.log(data);
			    			console.log("에러 발생!");
			    		}
			    	});
		    	}) //추천(랜덤) 상품 보기
	    </script>	    
	</head>
	<body>
		<jsp:include page="/resources/bootstrap/commons/menu_slideout.jsp" />
		<div class="site">
			<jsp:include page="/resources/bootstrap/commons/topbar.jsp"/>
			<jsp:include page="/resources/bootstrap/commons/index_header.jsp"/>
			<div id="main">
			<!-- 인덱스 배너 -->
				<div class="section">
					<div class="container-fluid">
						<div class="row">
							<div class="col-sm-12 p-0">
								<div id="rev_slider_2" class="rev_slider fullscreenbanner">
									<ul>
										<li data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="300" data-rotate="0" data-saveperformance="off" data-title="Slide">
											<img src="<%= request.getContextPath() %>/resources/bootstrap/images/slider/index_image_03_dimming.jpg" alt="" data-bgposition="center center" data-bgfit="cover" class="rev-slidebg"/>
												<div class="tp-caption GreatVibes-110"
												 data-x="['center','center','center','center']" data-hoffset="['-7','-7','0','-6']"
												 data-y="['middle','middle','top','top']" data-voffset="['-108','-108','359','202']"
												 data-fontsize="['112','112','80','40']" data-lineheight="['112','112','110','110']"
												 data-width="none" data-height="none" data-whitespace="nowrap" data-type="text"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">RudisFarm
											</div>
											<div class="tp-caption Lato-20-400"
												 data-x="['center','center','center','center']" data-hoffset="['0','0','0','6']"
												 data-y="['middle','middle','middle','top']" data-voffset="['19','19','72','303']"
												 data-lineheight="['36','36','36','22']" data-width="['576','576','576','328']"
												 data-height="['none','none','none','101']" data-whitespace="normal"
												 data-type="text" data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['center','center','center','center']"
												 data-paddingtop="[0,0,0,0]" data-paddingright="[0,0,0,0]"
												 data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]">
												 	채소에 대한 가치를 만들다
											</div>
<!-- 											<div class="tp-caption GreatVibes-110" -->
<!-- 												 data-x="['center','center','center','center']" data-hoffset="['-200','-200','-200','-100']" -->
<!-- 												 data-y="['top','top','top','top']" data-voffset="['208','208','208','208']" -->
<!-- 												 data-fontsize="['90','90','80','40']" data-width="none" data-height="none" -->
<!-- 												 data-whitespace="nowrap" data-type="text" data-responsive_offset="on" -->
<!-- 												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]' -->
<!-- 												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]" -->
<!-- 												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" -->
<!-- 												 data-paddingleft="[0,0,0,0]">With -->
<!-- 											</div> -->
<!-- 											<div class="tp-caption GreatVibes-180" -->
<!-- 												 data-x="['center','center','center','center']" data-hoffset="['170','170','170','100']" -->
<!-- 												 data-y="['top','top','top','top']" data-voffset="['285','285','285','285']" -->
<!-- 												 data-fontsize="['160','160','100','60']" data-width="none" data-height="none" -->
<!-- 												 data-whitespace="nowrap" data-type="text" data-responsive_offset="on" -->
<!-- 												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]' -->
<!-- 												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]" -->
<!-- 												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" -->
<!-- 												 data-paddingleft="[0,0,0,0]">RudisFarm -->
<!-- 											</div> -->
<!-- 											<div class="tp-caption GreatVibes-64" -->
<!-- 												 data-x="['center','center','center','center']" data-hoffset="['-170','-170','-170','-85']" -->
<!-- 												 data-y="['top','top','top','top']" data-voffset="['301','301','301','306']" -->
<!-- 												 data-width="none" data-height="none" data-whitespace="nowrap" data-type="text" -->
<!-- 												 data-responsive_offset="on" -->
<!-- 												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]' -->
<!-- 												 data-textAlign="['left','left','left','left']" -->
<!-- 												 data-paddingtop="[0,0,0,0]" data-paddingright="[0,0,0,0]" -->
<!-- 												 data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]"> -->
<!-- 											</div> -->
<!-- 											<div class="tp-caption tp-shape tp-shapewrapper bg-white" -->
<!-- 												 data-x="['center','center','center','center']" data-hoffset="['-330','-330','-330','-330']" -->
<!-- 												 data-y="['top','top','top','top']" data-voffset="['344','344','344','344']" -->
<!-- 												 data-width="170" data-height="1" data-whitespace="nowrap" data-type="shape" -->
<!-- 												 data-responsive_offset="on" -->
<!-- 												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]' -->
<!-- 												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]" -->
<!-- 												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" -->
<!-- 												 data-paddingleft="[0,0,0,0]"> -->
<!-- 											</div> -->
<!-- 											<div class="tp-caption Lato-20-400 uppercase" -->
<!-- 												 data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']" -->
<!-- 												 data-y="['top','top','top','top']" data-voffset="['470','470','470','470']" -->
<!-- 												 data-fontsize="['20','20','20','18']" data-width="['none','none','none','330']" -->
<!-- 												 data-height="['none','none','none','63']" -->
<!-- 												 data-whitespace="['nowrap','nowrap','nowrap','normal']" -->
<!-- 												 data-type="text" data-responsive_offset="on" -->
<!-- 												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]' -->
<!-- 												 data-textAlign="['center','center','center','center']" -->
<!-- 												 data-paddingtop="[0,0,0,0]" data-paddingright="[0,0,0,0]" -->
<!-- 												 data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]"> -->
<!-- 												 	채소에 대한 가치를 만들다 -->
<!-- 											</div> -->
<!-- 											<a  class="tp-caption btn-2 uppercase" href="/rudisfarm/product" -->
<!-- 												data-x="['center','center','center','center']" data-hoffset="['-90','-90','-90','-90']" -->
<!-- 												data-y="['top','top','top','top']" data-voffset="['540','540','540','540']" -->
<!-- 												data-width="none" data-height="none" data-whitespace="nowrap" data-type="text" -->
<!-- 												data-actions='' data-responsive_offset="on" -->
<!-- 												data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"},{"frame":"hover","speed":"300","ease":"Linear.easeNone","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgba(255,255,255,1);bg:transparent;bc:rgba(255,255,255,1);bw:2px 2px 2px 2px;"}]' -->
<!-- 												data-textAlign="['left','left','left','left']" data-paddingtop="[15,15,15,15]" -->
<!-- 												data-paddingright="[30,30,30,30]" data-paddingbottom="[15,15,15,15]" -->
<!-- 												data-paddingleft="[30,30,30,30]">상품 보기 -->
<!-- 											</a> -->
<!-- 											<a  class="tp-caption btn-1 uppercase" href="#" -->
<!-- 												data-x="['center','center','center','center']" data-hoffset="['90','90','90','90']" -->
<!-- 												data-y="['top','top','top','top']" data-voffset="['540','540','540','540']" -->
<!-- 												data-width="none" data-height="none" data-whitespace="nowrap" -->
<!-- 												data-type="text" data-actions='' data-responsive_offset="on" -->
<!-- 												data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"},{"frame":"hover","speed":"300","ease":"Linear.easeNone","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgba(255,255,255,1);bg:rgba(95,189,116,1);bc:rgba(95,189,116,1);bw:2px 2px 2px 2px;"}]' -->
<!-- 												data-textAlign="['left','left','left','left']" data-paddingtop="[15,15,15,15]" -->
<!-- 												data-paddingright="[30,30,30,30]" data-paddingbottom="[15,15,15,15]" -->
<!-- 												data-paddingleft="[30,30,30,30]">사이트 소개  -->
<!-- 											</a> -->
										</li>
										<li data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="300" data-rotate="0" data-saveperformance="off" data-title="Slide">
											<img src="<%= request.getContextPath() %>/resources/bootstrap/images/slider/index_image_02_dimming.jpg" alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" class="rev-slidebg" />
											<div class="tp-caption GreatVibes-110"
												 data-x="['center','center','center','center']" data-hoffset="['-7','-7','0','-6']"
												 data-y="['middle','middle','top','top']" data-voffset="['-108','-108','359','202']"
												 data-fontsize="['112','112','80','40']" data-lineheight="['112','112','110','110']"
												 data-width="none" data-height="none" data-whitespace="nowrap" data-type="text"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">Reliable Seller
											</div>
											<div class="tp-caption Lato-20-400"
												 data-x="['center','center','center','center']" data-hoffset="['0','0','0','6']"
												 data-y="['middle','middle','middle','top']" data-voffset="['19','19','72','303']"
												 data-lineheight="['36','36','36','22']" data-width="['576','576','576','328']"
												 data-height="['none','none','none','101']" data-whitespace="normal"
												 data-type="text" data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['center','center','center','center']"
												 data-paddingtop="[0,0,0,0]" data-paddingright="[0,0,0,0]"
												 data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]">
												 	믿을 수 있는 상품들만을 엄선하여 안심할 수 있습니다
											</div>
<!-- 											<div class="tp-caption GreatVibes-110" -->
<!-- 												 data-x="['left','left','center','center']" data-hoffset="['297','297','-16','-8']" -->
<!-- 												 data-y="['middle','middle','top','top']" data-voffset="['-163','-163','202','115']" -->
<!-- 												 data-fontsize="['112','112','80','40']" data-lineheight="['56','56','110','110']" -->
<!-- 												 data-width="none" data-height="none" data-whitespace="nowrap" data-type="text" -->
<!-- 												 data-responsive_offset="on" -->
<!-- 												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]' -->
<!-- 												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]" -->
<!-- 												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" -->
<!-- 												 data-paddingleft="[0,0,0,0]">Reliable Seller  -->
<!-- 											</div> -->
<!-- 											<div class="tp-caption Lato-20-400" -->
<!-- 												 data-x="['left','left','left','center']" data-hoffset="['305','305','70','6']" -->
<!-- 												 data-y="['middle','middle','top','top']" data-voffset="['57','57','72','303']" -->
<!-- 												 data-lineheight="['36','36','36','22']" data-width="['657','657','657','328']" -->
<!-- 												 data-height="['66','66','66','101']" data-whitespace="normal" data-type="text" -->
<!-- 												 data-responsive_offset="on" -->
<!-- 												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]' -->
<!-- 												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]" -->
<!-- 												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" -->
<!-- 												 data-paddingleft="[0,0,0,0]"> -->
<!-- 												 	믿을 수 있는 상품들만을 엄선하여 안심할 수 있습니다. -->
<!-- 											</div>  -->
<!-- 											<a  class="tp-caption btn-2 uppercase" href="/rudisfarm/product" -->
<!-- 												data-x="['left','left','center','center']" data-hoffset="['304','304','0','0']" -->
<!-- 												data-y="['middle','middle','middle','middle']" data-voffset="['182','182','182','115']" -->
<!-- 												data-width="none" data-height="none" data-whitespace="nowrap" data-type="text" -->
<!-- 												data-actions='' data-responsive_offset="on" -->
<!-- 												data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"},{"frame":"hover","speed":"300","ease":"Linear.easeNone","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgba(255,255,255,1);bg:transparent;bc:rgba(255,255,255,1);bw:2px 2px 2px 2px;"}]' -->
<!-- 												data-textAlign="['left','left','left','left']" data-paddingtop="[15,15,15,15]" -->
<!-- 												data-paddingright="[30,30,30,30]" data-paddingbottom="[15,15,15,15]" -->
<!-- 												data-paddingleft="[30,30,30,30]">상품 보기 -->
<!-- 											</a> -->
<!-- 											<div class="tp-caption" -->
<!-- 												 data-x="['left','left','left','left']" data-hoffset="['184','184','71','46']" -->
<!-- 												 data-y="['middle','middle','middle','middle']" data-voffset="['-100','-100','-76','-168']" -->
<!-- 												 data-width="none" data-height="none" data-whitespace="nowrap" data-type="image" -->
<!-- 												 data-responsive_offset="on" -->
<!-- 												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]' -->
<!-- 												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]" -->
<!-- 												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" -->
<!-- 												 data-paddingleft="[0,0,0,0]"> -->
<%-- 												 	<img src="<%= request.getContextPath() %>/resources/bootstrap/images/slider/slide_22.png" alt="" /> --%>
<!-- 											</div> -->
<!-- 											<div class="tp-caption" -->
<!-- 												 data-x="['left','left','left','left']" data-hoffset="['301','301','200','123']" -->
<!-- 												 data-y="['middle','middle','middle','middle']" data-voffset="['-61','-61','-53','-136']" -->
<!-- 												 data-width="none" data-height="none" data-whitespace="nowrap" data-type="image" -->
<!-- 												 data-responsive_offset="on" -->
<!-- 												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]' -->
<!-- 												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]" -->
<!-- 												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" -->
<!-- 												 data-paddingleft="[0,0,0,0]"> -->
<%-- 												 	<img src="<%= request.getContextPath() %>/resources/bootstrap/images/slider/slide_23.png" alt="" /> --%>
<!-- 											</div> -->
										</li>
										<li data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="300" data-rotate="0" data-saveperformance="off" data-title="Slide">
											<img src="<%= request.getContextPath() %>/resources/bootstrap/images/slider/index_image_01_dimming.jpg"  alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" class="rev-slidebg" />
											<div class="tp-caption GreatVibes-110"
												 data-x="['center','center','center','center']" data-hoffset="['-7','-7','0','-6']"
												 data-y="['middle','middle','top','top']" data-voffset="['-108','-108','359','202']"
												 data-fontsize="['112','112','80','40']" data-lineheight="['112','112','110','110']"
												 data-width="none" data-height="none" data-whitespace="nowrap" data-type="text"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">Direct Delivery
											</div>
											<div class="tp-caption Lato-20-400"
												 data-x="['center','center','center','center']" data-hoffset="['0','0','0','6']"
												 data-y="['middle','middle','middle','top']" data-voffset="['19','19','72','303']"
												 data-lineheight="['36','36','36','22']" data-width="['576','576','576','328']"
												 data-height="['none','none','none','101']" data-whitespace="normal"
												 data-type="text" data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['center','center','center','center']"
												 data-paddingtop="[0,0,0,0]" data-paddingright="[0,0,0,0]"
												 data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]">
												 	주문 즉시 산지에서 배송되어 신선합니다
											</div>
<!-- 											<a  class="tp-caption btn-2 uppercase" href="#" -->
<!-- 												data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']" -->
<!-- 												data-y="['middle','middle','middle','middle']" data-voffset="['133','133','182','115']" -->
<!-- 												data-width="none" data-height="none" data-whitespace="nowrap" data-type="text" -->
<!-- 												data-actions='' data-responsive_offset="on" -->
<!-- 												data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"},{"frame":"hover","speed":"300","ease":"Linear.easeNone","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgba(255,255,255,1);bg:transparent;bc:rgba(255,255,255,1);bw:2px 2px 2px 2px;"}]' -->
<!-- 												data-textAlign="['left','left','left','left']" data-paddingtop="[15,15,15,15]" -->
<!-- 												data-paddingright="[30,30,30,30]" data-paddingbottom="[15,15,15,15]" -->
<!-- 												data-paddingleft="[30,30,30,30]">상품 보기 -->
<!-- 											</a> -->
<!-- 											<div class="tp-caption Lato-34-900 uppercase" -->
<!-- 												 data-x="['center','center','center','center']" data-hoffset="['-4','-4','0','-5']" -->
<!-- 												 data-y="['middle','middle','top','top']" data-voffset="['-202','-202','311','181']" -->
<!-- 												 data-fontsize="['18','18','20','20']" data-lineheight="['18','18','20','20']" -->
<!-- 												 data-fontweight="['700','700','400','400']" data-width="none" data-height="none" -->
<!-- 												 data-whitespace="nowrap" data-type="text" data-responsive_offset="on" -->
<!-- 												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]' -->
<!-- 												 data-textAlign="['center','center','center','center']" data-paddingtop="[0,0,0,0]" -->
<!-- 												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]">인기 상품 -->
<!-- 											</div> -->
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 인덱스 배너 -->	
				
				<div class="section mt-6">
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<div class="organik-icon">
									<i class="organik-leaves"></i>
								</div>
								<h2 class="text-center section-title mtn-2">프리미엄 상품</h2>
								<p class="text-center">루디스팜의 프리미엄상품을 만나보세요.</p>
							</div>
						</div>
					</div>
				</div>
				<!-- 프리미엄 상품란 -->
				<div class="section mt-10 mb-5">
					<div class="container">
						<div class="row" id="indexPremiumProductDiv">
							
						</div>
					</div>
				</div>
				<!-- /프리미엄 상품란 -->
				
				<div class="section mtn-5 mb-5">
					<div class="container">
						<div class="row">
							<div class="organik-process">
								<div class="col-md-3 col-sm-6 organik-process-small-icon-step">
									<div class="icon">
										<i class="organik-delivery"></i>
									</div>
									<div class="content">
										<div class="title">배송</div>
										<div class="text">빠른 배송</div>
									</div>
								</div>
								<div class="col-md-3 col-sm-6 organik-process-small-icon-step">
									<div class="icon">
										<i class="organik-hours-support"></i>
									</div>
									<div class="content">
										<div class="title">추천</div>
										<div class="text">소비자 추천</div>
									</div>
								</div>
								<div class="col-md-3 col-sm-6 organik-process-small-icon-step">
									<div class="icon">
										<i class="organik-credit-card"></i>
									</div>
									<div class="content">
										<div class="title">안전한 식품</div>
										<div class="text">인증</div>
									</div>
								</div>
								<div class="col-md-3 col-sm-6 organik-process-small-icon-step">
									<div class="icon">
										<i class="organik-lettuce"></i>
									</div>
									<div class="content">
										<div class="title">정성을 담아</div>
										<div class="text">좋은 서비스</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="section mt-16">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-4 col-sm-12 p-0">
							<div class="text-center">
							
								<p>(단위 : 1kg)</p>
								<div id="chart_div" ></div>
								<input type="button" onclick="drawChart(1)" value="과일류">
								<input type="button" onclick="drawChart(2)" value="채소류">
								<input type="button" onclick="drawChart(3)" value="식량작물">
								<input type="button" onclick="drawChart(4)" value="식량작물">

							</div>
							</div>
							<div class="col-md-8 col-sm-12 p-0">
								<div class="text-center">
									<div class="text-center mb-1 section-pretitle fz-34">Discover</div>
									<h2 class="text-center section-title mtn-2 fz-24">신규 상품</h2>
									<div class="product-carousel" id="indexNewProductDiv" data-auto-play="true" data-desktop="3" data-laptop="2" data-tablet="2" data-mobile="1">
										
										<%-- <!-- 신규 상품1 -->
										<!-- /신규 상품1 --> --%>
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="section mt-10 mb-4">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-4 col-sm-12 col-md-push-8 p-0">
								<div class="organik-featured-product style-4" data-bg-color="#e7f2d8">
									<div class="organik-featured-product-box">
										<div class="organik-featured-product-content">
											<h3 class="title" style="color:#ffffff">Fresh</h3>
											<h1 class="subtitle">Fruits</h1>
											<h4 class="subtitle-2" style="color:#ffffff">더 많은 상품 보기</h4>
											<div class="text" style="color:#ffffff">루디스팜은 중간 유통이 없기 때문에 신선한 식재를 값싼 가격에 만나보실 수 있습니다.</div>
											<a class="organik-btn small" href="/rudisfarm/product">보러가기</a>
										</div>
									</div>
									<img src="<%= request.getContextPath() %>/resources/upload/images/indexImageA.jpg" alt="" />
									<div class="vertical-text"></div>
								</div>
							</div>
							<div class="col-md-8 col-sm-12 col-md-pull-4 p-0">
								<div class="text-center">
									<div class="text-center mb-1 section-pretitle fz-34">Discover</div>
									<h2 class="text-center section-title mtn-2 fz-24">추천 상품</h2>
									<div class="product-carousel" data-auto-play="true" data-desktop="3" data-laptop="2" data-tablet="2" data-mobile="1" id="indexRandomProduct">
										
										<%--  <!-- 추천 상품 1 -->
										
										<!-- /추천 상품 1 --> --%>
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="/resources/bootstrap/commons/footer.jsp"/>
		</div>

		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/add-cart.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/categori-header.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/cart-list.js"></script>
		
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery-migrate.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/modernizr-2.7.1.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/owl.carousel.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/script.js"></script>
		
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery.themepunch.tools.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery.themepunch.revolution.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/extensions/revolution.extension.slideanims.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/extensions/revolution.extension.actions.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/extensions/revolution.extension.layeranimation.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/extensions/revolution.extension.kenburn.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/extensions/revolution.extension.navigation.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/extensions/revolution.extension.migration.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/extensions/revolution.extension.parallax.min.js"></script>
	</body>
	
</html>