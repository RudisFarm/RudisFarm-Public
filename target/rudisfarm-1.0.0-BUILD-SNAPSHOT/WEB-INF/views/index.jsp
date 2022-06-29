<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"/>
		<link rel="shortcut icon" href="<%= request.getContextPath() %>/resources/bootstrap/images/favicon.ico"/>
		<title>Organik Shop &#8211; Homepage Store | Organik HTML Template</title>

		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" type="text/css" media="all"/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/font-awesome.min.css" type="text/css" media="all" />
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/ionicons.min.css" type="text/css" media="all" />
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/owl.carousel.css" type="text/css" media="all"/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/owl.theme.css" type="text/css" media="all"/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/settings.css" type="text/css" media="all"/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/style.css" type="text/css" media="all"/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/custom.css" type="text/css" media="all"/>
		<link href="//fonts.googleapis.com/css?family=Great+Vibes%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet"/>
	</head>
	<body>
		
		<div class="site">
			<jsp:include page="/resources/bootstrap/commons/index_header.jsp"/>
			<div id="main">
				<div class="section">
					<div class="container-fluid">
						<div class="row">
							<div class="col-sm-12 p-0">
								<div id="rev_slider_2" class="rev_slider fullscreenbanner">
									<ul>
										<li data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="300" data-rotate="0" data-saveperformance="off" data-title="Slide"> 
											<img src="<%= request.getContextPath() %>/resources/bootstrap/images/slider/cart_banner3.jpg" alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" class="rev-slidebg" />
											<div class="tp-caption"
												 data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
												 data-y="['top','top','top','top']" data-voffset="['167','167','167','149']"
												 data-width="none" data-height="none" data-whitespace="nowrap" data-type="image"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">
												 	<img src="<%= request.getContextPath() %>/resources/bootstrap/images/slider/slide_11.png" alt="" />
											</div>
											<div class="tp-caption tp-shape tp-shapewrapper bg-white"
												 data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
												 data-y="['top','top','top','top']" data-voffset="['222','222','222','203']"
												 data-width="276" data-height="2" data-whitespace="nowrap" data-type="shape"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">
											</div>
											<div class="tp-caption tp-shape tp-shapewrapper bg-white"
												 data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
												 data-y="['top','top','top','top']" data-voffset="['265','265','265','240']"
												 data-width="276" data-height="2" data-whitespace="nowrap" data-type="shape"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">
											</div>
											<div class="tp-caption Organik-title-01"
												 data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
												 data-y="['top','top','top','top']" data-voffset="['235','235','235','211']"
												 data-width="none" data-height="none" data-whitespace="nowrap" data-type="text"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['center','center','center','center']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">a taste of real food
											</div>
											<div class="tp-caption Organik-title-02"
												 data-x="['center','center','center','center']" data-hoffset="['0','0','0','-3']"
												 data-y="['top','top','top','top']" data-voffset="['295','295','295','270']"
												 data-width="none" data-height="none" data-whitespace="nowrap" data-type="text"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">The Best Quality
											</div>
											<div class="tp-caption"
												 data-x="['center','center','center','center']" data-hoffset="['0','0','0','-1']"
												 data-y="['top','top','top','top']" data-voffset="['341','341','341','315']"
												 data-width="none" data-height="none" data-whitespace="nowrap" data-type="image"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">
												 	<img src="<%= request.getContextPath() %>/resources/bootstrap/images/slider/slide_12.png" alt="" />
											</div>
											<div class="tp-caption"
												 data-x="['center','center','center','center']" data-hoffset="['0','0','0','3']"
												 data-y="['top','top','top','top']" data-voffset="['452','452','452','356']"
												 data-width="none" data-height="none" data-whitespace="nowrap" data-type="image"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">
												 	<img src="<%= request.getContextPath() %>/resources/bootstrap/images/slider/slide_13.png" alt="" />
											</div>
											<div class="tp-caption desc-1"
												 data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
												 data-y="['top','top','top','top']" data-voffset="['567','567','567','440']"
												 data-width="['699','699','699','380']" data-height="['125','125','125','none']"
												 data-whitespace="normal" data-type="text" data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['center','center','center','center']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">
												 	Our products are freshly harvested, washed ready for box and finally delivered from our family farm right to your doorstep.
											</div> 
											<a  class="tp-caption btn-2" href="#"
												data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
												data-y="['top','top','top','top']" data-voffset="['687','687','687','600']"
												data-width="none" data-height="none" data-whitespace="nowrap" data-type="text"
												data-actions='' data-responsive_offset="on"
												data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"},{"frame":"hover","speed":"300","ease":"Linear.easeNone","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgba(255,255,255,1);bg:transparent;bc:rgba(255,255,255,1);bw:2px 2px 2px 2px;"}]'
												data-textAlign="['left','left','left','left']" data-paddingtop="[15,15,15,15]"
												data-paddingright="[30,30,30,30]" data-paddingbottom="[15,15,15,15]"
												data-paddingleft="[30,30,30,30]">shop now 
											</a>
										</li>
										<li data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="300" data-rotate="0" data-saveperformance="off" data-title="Slide"> 
											<img src="<%= request.getContextPath() %>/resources/bootstrap/images/slider/index_slider3.jpg"  alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" class="rev-slidebg" />
											<div class="tp-caption Organik-title-02"
												 data-x="['center','center','center','center']" data-hoffset="['8','8','8','-3']"
												 data-y="['top','top','top','top']" data-voffset="['224','224','224','270']"
												 data-fontsize="['48','48','48','28']" data-lineheight="['48','48','48','28']"
												 data-width="none" data-height="none" data-whitespace="nowrap" data-type="text"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">The Best
											</div>
											<div class="tp-caption"
												 data-x="['center','center','center','center']" data-hoffset="['0','0','0','3']"
												 data-y="['top','top','top','top']" data-voffset="['573','573','573','356']"
												 data-width="none" data-height="none" data-whitespace="nowrap" data-type="image"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">
												 	<img src="<%= request.getContextPath() %>/resources/bootstrap/images/slider/slide_14.png" alt="" />
											</div>
											<div class="tp-caption"
												 data-x="['center','center','center','center']" data-hoffset="['2','2','2','3']"
												 data-y="['top','top','top','top']" data-voffset="['410','410','410','356']"
												 data-width="none" data-height="none" data-whitespace="nowrap" data-type="image"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">
												 	<img src="<%= request.getContextPath() %>/resources/bootstrap/images/slider/slide_15.png" alt="" />
											</div>
											<div class="tp-caption Organik-title-02"
												 data-x="['center','center','center','center']" data-hoffset="['-99','-99','-99','-3']"
												 data-y="['top','top','top','top']" data-voffset="['426','426','426','270']"
												 data-fontsize="['34','34','34','28']" data-lineheight="['34','34','34','28']"
												 data-width="none" data-height="none" data-whitespace="nowrap" data-type="text"
												 data-responsive_offset="on" data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']"
												 data-paddingtop="[0,0,0,0]" data-paddingright="[0,0,0,0]"
												 data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]">Est.
											</div>
											<div class="tp-caption Organik-title-02"
												 data-x="['center','center','center','center']" data-hoffset="['103','103','103','-3']"
												 data-y="['top','top','top','top']" data-voffset="['425','425','425','270']"
												 data-fontsize="['34','34','34','28']" data-lineheight="['34','34','34','28']"
												 data-width="none" data-height="none" data-whitespace="nowrap" data-type="text"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">1990
											</div>
											<div class="tp-caption desc-2"
												 data-x="['center','center','center','center']" data-hoffset="['1','1','1','0']"
												 data-y="['top','top','top','top']" data-voffset="['507','507','507','440']"
												 data-fontsize="['14','14','14','18']" data-lineheight="['14','14','14','32']"
												 data-fontweight="['900','900','900','400']" data-width="['227','227','227','380']"
												 data-height="['30','30','30','none']" data-whitespace="normal" data-type="text"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['center','center','center','center']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]">trust the nature
											</div>
											<div class="tp-caption"
												 data-x="['center','center','center','center']" data-hoffset="['6','6','6','3']"
												 data-y="['top','top','top','top']" data-voffset="['325','325','325','356']"
												 data-width="none" data-height="none" data-whitespace="nowrap" data-type="image"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">
												 	<img src="<%= request.getContextPath() %>/resources/bootstrap/images/slider/slide_16.png" alt="" />
											</div>
											<div class="tp-caption"
												 data-x="['center','center','center','center']" data-hoffset="['135','135','135','3']"
												 data-y="['top','top','top','top']" data-voffset="['243','243','243','356']"
												 data-width="none" data-height="none" data-whitespace="nowrap" data-type="image"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">
												 	<img src="<%= request.getContextPath() %>/resources/bootstrap/images/slider/slide_17.png" alt="" />
											</div>
											<div class="tp-caption"
												 data-x="['center','center','center','center']" data-hoffset="['-121','-121','-121','3']"
												 data-y="['top','top','top','top']" data-voffset="['240','240','240','356']"
												 data-width="none" data-height="none" data-whitespace="nowrap" data-type="image"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">
												 	<img src="<%= request.getContextPath() %>/resources/bootstrap/images/slider/slide_17.png" alt="" />
											</div>
										</li>
										<li data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="300" data-rotate="0" data-saveperformance="off" data-title="Slide"> 
											<img src="<%= request.getContextPath() %>/resources/bootstrap/images/slider/index_slider4.jpg"  alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" class="rev-slidebg" />
											<div class="tp-caption Organik-title-02"
												 data-x="['center','center','center','center']" data-hoffset="['0','0','0','-7']"
												 data-y="['top','top','top','top']" data-voffset="['394','394','394','225']"
												 data-fontsize="['120','120','120','80']" data-lineheight="['120','120','120','80']"
												 data-width="none" data-height="none" data-whitespace="nowrap" data-type="text"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">Farm Fresh
											</div>
											<div class="tp-caption"
												 data-x="['center','center','center','center']" data-hoffset="['0','0','1','-3']"
												 data-y="['top','top','top','top']" data-voffset="['516','516','530','413']"
												 data-width="none" data-height="none" data-whitespace="nowrap" data-type="image"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]">
												 	<img src="<%= request.getContextPath() %>/resources/bootstrap/images/slider/slide_18.png" alt="" />
											</div>
											<div class="tp-caption"
												 data-x="['center','center','center','center']" data-hoffset="['-6','-6','-6','-4']"
												 data-y="['top','top','top','top']" data-voffset="['291','291','291','299']"
												 data-width="none" data-height="none" data-whitespace="nowrap" data-type="image"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">
												 	<img src="<%= request.getContextPath() %>/resources/bootstrap/images/slider/slide_19.png" alt="" />
											</div>
											<div class="tp-caption Organik-title-02 Lato"
												 data-x="['center','center','center','center']" data-hoffset="['-114','-114','-114','-113']"
												 data-y="['top','top','top','top']" data-voffset="['329','329','329','330']"
												 data-width="none" data-height="none" data-whitespace="nowrap" data-type="text"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">SINCE
											</div>
											<div class="tp-caption Organik-title-02 Lato"
												 data-x="['center','center','center','center']" data-hoffset="['102','102','102','101']"
												 data-y="['top','top','top','top']" data-voffset="['330','330','330','330']"
												 data-width="none" data-height="none" data-whitespace="nowrap" data-type="text"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">1990
											</div>
											<div class="tp-caption"
												 data-x="['center','center','center','center']" data-hoffset="['-8','-8','-8','-1']"
												 data-y="['top','top','top','top']" data-voffset="['247','247','247','155']"
												 data-width="none" data-height="none" data-whitespace="nowrap" data-type="image"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">
												 	<img src="<%= request.getContextPath() %>/resources/bootstrap/images/slider/slide_20.png" alt="" />
											</div>
											<div class="tp-caption"
												 data-x="['center','center','center','center']" data-hoffset="['0','0','0','1']"
												 data-y="['top','top','top','top']" data-voffset="['577','577','577','463']"
												 data-width="none" data-height="none" data-whitespace="nowrap" data-type="image"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">
												 	<img src="<%= request.getContextPath() %>/resources/bootstrap/images/slider/slide_21.png" alt="" />
											</div>
											<div class="tp-caption tp-shape tp-shapewrapper bg-white"
												 data-x="['center','center','center','center']" data-hoffset="['102','102','102','102']"
												 data-y="['top','top','top','top']" data-voffset="['356','356','356','356']"
												 data-width="70" data-height="1" data-whitespace="nowrap" data-type="shape"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">
											</div>
											<div class="tp-caption tp-shape tp-shapewrapper bg-white"
												 data-x="['center','center','center','center']" data-hoffset="['102','102','102','102']"
												 data-y="['top','top','top','top']" data-voffset="['323','323','323','323']"
												 data-width="70" data-height="1" data-whitespace="nowrap" data-type="shape"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">
											</div>
											<div class="tp-caption tp-shape tp-shapewrapper bg-white"
												 data-x="['center','center','center','center']" data-hoffset="['-115','-115','-115','-115']"
												 data-y="['top','top','top','top']" data-voffset="['356','356','356','356']"
												 data-width="70" data-height="1" data-whitespace="nowrap" data-type="shape"
												 data-responsive_offset="on"
												 data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">
											</div>
											<div class="tp-caption tp-shape tp-shapewrapper bg-white"
												 data-x="['center','center','center','center']" data-hoffset="['-115','-115','-115','-115']"
												 data-y="['top','top','top','top']" data-voffset="['323','323','323','323']"
												 data-width="70" data-height="1" data-whitespace="nowrap" data-type="shape"
												 data-responsive_offset="on" data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":500,"ease":"Power2.easeInOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
												 data-textAlign="['left','left','left','left']" data-paddingtop="[0,0,0,0]"
												 data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]"
												 data-paddingleft="[0,0,0,0]">
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="section mt-6">
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<div class="organik-icon">
									<i class="organik-leaves"></i>
								</div>
								<h2 class="text-center section-title mtn-2">Welcome to organik</h2>
								<p class="text-center">From our family farm right to your doorstep.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="section mt-10 mb-5">
					<div class="container">
						<div class="row">
							<div class="col-sm-4">
								<div class="organik-about">
									<div class="image style-2" data-bg-color="#f5e9e2">
										<img src="<%= request.getContextPath() %>/resources/bootstrap/images/about/about_360x255.jpg" alt="" />
										<div class="organik-about-letter">w</div>
									</div>
									<div class="content">
										<h5>Who we are?</h5>
										<p>Understanding the sometimes harmful methods of modern agriculture, we started a niche for quality organic produce grown.</p>
										<a class="link" href="#">
											<i class="ion-plus-round"></i> Read more
										</a>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="organik-about">
									<div class="image style-2" data-bg-color="#e7f2d8">
										<img src="<%= request.getContextPath() %>/resources/bootstrap/images/about/about_360x255.jpg" alt="" />
										<div class="organik-about-letter">h</div>
									</div>
									<div class="content">
										<h5>How we work?</h5>
										<p>We believe itâs the best way to inspire our community to relish in the taste of real, seasonal produce and keep connected to the land.</p>
										<a class="link" href="#">
											<i class="ion-plus-round"></i> Read more
										</a>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="organik-about">
									<div class="image style-2" data-bg-color="#f6edd0">
										<img src="<%= request.getContextPath() %>/resources/bootstrap/images/about/about_360x255.jpg" alt="" />
										<div class="organik-about-letter">w</div>
									</div>
									<div class="content">
										<h5>What we grow?</h5>
										<p>We take special care to select and grow specific crop varieties where exceptional flavor is the focus, with a determination to bring the best-tasting produce.</p>
										<a class="link" href="#">
											<i class="ion-plus-round"></i> Read more
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="section mtn-5 mb-5">
					<div class="container">
						<div class="row">
							<div class="organik-process">
								<div class="col-md-3 col-sm-6 organik-process-small-icon-step">
									<div class="icon">
										<i class="organik-delivery"></i>
									</div>
									<div class="content">
										<div class="title">Free shipping</div>
										<div class="text">All order over $100</div>
									</div>
								</div>
								<div class="col-md-3 col-sm-6 organik-process-small-icon-step">
									<div class="icon">
										<i class="organik-hours-support"></i>
									</div>
									<div class="content">
										<div class="title">Customer support</div>
										<div class="text">Support 24/7</div>
									</div>
								</div>
								<div class="col-md-3 col-sm-6 organik-process-small-icon-step">
									<div class="icon">
										<i class="organik-credit-card"></i>
									</div>
									<div class="content">
										<div class="title">Secure payments</div>
										<div class="text">Confirmed</div>
									</div>
								</div>
								<div class="col-md-3 col-sm-6 organik-process-small-icon-step">
									<div class="icon">
										<i class="organik-lettuce"></i>
									</div>
									<div class="content">
										<div class="title">Made with love</div>
										<div class="text">Best services</div>
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
								<div class="organik-featured-product style-4" data-bg-color="#f8f1d9">
									<div class="organik-featured-product-box">
										<div class="organik-featured-product-content">
											<h3 class="title">Fresh</h3>
											<h1 class="subtitle">Juices</h1>
											<h4 class="subtitle-2">Cashew Juice</h4>
											<div class="text">Hand crafted fresh raw organic juice and green smoothies</div>
											<a class="organik-btn small" href="#">Shop now</a>
										</div>
									</div>
									<img src="<%= request.getContextPath() %>/resources/bootstrap/images/image_480x520.jpg" alt="" />
									<div class="vertical-text">Featured Product</div>
								</div>
							</div>
							<div class="col-md-8 col-sm-12 p-0">
								<div class="text-center">
									<div class="text-center mb-1 section-pretitle fz-34">Discover</div>
									<h2 class="text-center section-title mtn-2 fz-24">Featured products</h2>
									<div class="product-carousel" data-auto-play="true" data-desktop="3" data-laptop="2" data-tablet="2" data-mobile="1">
										<div class="product-item text-center">
											<div class="product-thumb">
												<a href="shop-detail.html">
													<div class="badges">
														<span class="hot">Hot</span>
														<span class="onsale">Sale!</span>
													</div>
													<img src="<%= request.getContextPath() %>/resources/bootstrap/images/shop/shop_300x300.jpg" alt="" />
												</a>
												<div class="product-action">
													<span class="add-to-cart">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
													</span>
													<span class="wishlist">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
													</span>
													<span class="quickview">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
													</span>
													<span class="compare">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Compare"></a>
													</span>
												</div>
											</div>
											<div class="product-info">
												<a href="shop-detail.html">
													<h2 class="title">Orange Juice</h2>
													<span class="price">
														<del>$15.00</del> 
														<ins>$12.00</ins>
													</span>
												</a>
											</div>
										</div>
										<div class="product-item text-center">
											<div class="product-thumb">
												<a href="shop-detail.html">
													<div class="badges">
														<span class="hot">Hot</span>
													</div>
													<img src="<%= request.getContextPath() %>/resources/bootstrap/images/shop/shop_300x300.jpg" alt="" />
												</a>
												<div class="product-action">
													<span class="add-to-cart">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
													</span>
													<span class="wishlist">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
													</span>
													<span class="quickview">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
													</span>
													<span class="compare">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Compare"></a>
													</span>
												</div>
											</div>
											<div class="product-info">
												<a href="shop-detail.html">
													<h2 class="title">Aurore Grape</h2>
													<span class="price">$9.00</span>
												</a>
											</div>
										</div>
										<div class="product-item text-center">
											<div class="product-thumb">
												<a href="shop-detail.html">
													<div class="badges">
														<span class="hot">Hot</span>
													</div>
													<img src="<%= request.getContextPath() %>/resources/bootstrap/images/shop/shop_300x300.jpg" alt="" />
												</a>
												<div class="product-action">
													<span class="add-to-cart">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
													</span>
													<span class="wishlist">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
													</span>
													<span class="quickview">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
													</span>
													<span class="compare">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Compare"></a>
													</span>
												</div>
											</div>
											<div class="product-info">
												<a href="shop-detail.html">
													<h2 class="title">Blueberry Jam</h2>
													<span class="price">$15.00</span>
												</a>
											</div>
										</div>
										<div class="product-item text-center">
											<div class="product-thumb">
												<a href="shop-detail.html">
													<img src="<%= request.getContextPath() %>/resources/bootstrap/images/shop/shop_300x300.jpg" alt="" />
												</a>
												<div class="product-action">
													<span class="add-to-cart">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
													</span>
													<span class="wishlist">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
													</span>
													<span class="quickview">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
													</span>
													<span class="compare">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Compare"></a>
													</span>
												</div>
											</div>
											<div class="product-info">
												<a href="shop-detail.html">
													<h2 class="title">Passionfruit</h2>
													<span class="price">$35.00</span>
												</a>
											</div>
										</div>
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
											<h3 class="title">Fresh</h3>
											<h1 class="subtitle">Fruits</h1>
											<h4 class="subtitle-2">Cherries</h4>
											<div class="text">A beautiful selection of fresh juicy, ripe organic fruits</div>
											<a class="organik-btn small" href="#">Shop now</a>
										</div>
									</div>
									<img src="<%= request.getContextPath() %>/resources/bootstrap/images/image_480x520.jpg" alt="" />
									<div class="vertical-text">New Product</div>
								</div>
							</div>
							<div class="col-md-8 col-sm-12 col-md-pull-4 p-0">
								<div class="text-center">
									<div class="text-center mb-1 section-pretitle fz-34">Discover</div>
									<h2 class="text-center section-title mtn-2 fz-24">New products</h2>
									<div class="product-carousel" data-auto-play="true" data-desktop="3" data-laptop="2" data-tablet="2" data-mobile="1">
										<div class="product-item text-center">
											<div class="product-thumb">
												<a href="shop-detail.html">
													<div class="badges">
														<span class="hot">Hot</span>
													</div>
													<img src="<%= request.getContextPath() %>/resources/bootstrap/images/shop/shop_300x300.jpg" alt="" />
												</a>
												<div class="product-action">
													<span class="add-to-cart">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
													</span>
													<span class="wishlist">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
													</span>
													<span class="quickview">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
													</span>
													<span class="compare">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Compare"></a>
													</span>
												</div>
											</div>
											<div class="product-info">
												<a href="shop-detail.html">
													<h2 class="title">Carrot</h2>
													<span class="price">$12.00</span>
												</a>
											</div>
										</div>
										<div class="product-item text-center">
											<div class="product-thumb">
												<a href="shop-detail.html">
													<span class="outofstock"><span>Out</span>of stock</span>
													<img src="<%= request.getContextPath() %>/resources/bootstrap/images/shop/shop_300x300.jpg" alt="" />
												</a>
												<div class="product-action">
													<span class="add-to-cart">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
													</span>
													<span class="wishlist">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
													</span>
													<span class="quickview">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
													</span>
													<span class="compare">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Compare"></a>
													</span>
												</div>
											</div>
											<div class="product-info">
												<a href="shop-detail.html">
													<h2 class="title">Sprouting Broccoli</h2>
													<span class="price">$6.00</span>
												</a>
											</div>
										</div>
										<div class="product-item text-center">
											<div class="product-thumb">
												<a href="shop-detail.html">
													<img src="<%= request.getContextPath() %>/resources/bootstrap/images/shop/shop_300x300.jpg" alt="" />
												</a>
												<div class="product-action">
													<span class="add-to-cart">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
													</span>
													<span class="wishlist">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
													</span>
													<span class="quickview">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
													</span>
													<span class="compare">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Compare"></a>
													</span>
												</div>
											</div>
											<div class="product-info">
												<a href="shop-detail.html">
													<h2 class="title">Chinese Cabbage</h2>
													<span class="price">$9.00</span>
												</a>
											</div>
										</div>
										<div class="product-item text-center">
											<div class="product-thumb">
												<a href="shop-detail.html">
													<div class="badges">
														<span class="hot">Hot</span>
													</div>
													<img src="<%= request.getContextPath() %>/resources/bootstrap/images/shop/shop_300x300.jpg" alt="" />
												</a>
												<div class="product-action">
													<span class="add-to-cart">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
													</span>
													<span class="wishlist">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
													</span>
													<span class="quickview">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
													</span>
													<span class="compare">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Compare"></a>
													</span>
												</div>
											</div>
											<div class="product-info">
												<a href="shop-detail.html">
													<h2 class="title">Tieton Cherry</h2>
													<span class="price">$9.00</span>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
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
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/script.js"></script>
		
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery.themepunch.tools.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery.themepunch.revolution.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/extensions/revolution.extension.video.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/extensions/revolution.extension.slideanims.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/extensions/revolution.extension.actions.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/extensions/revolution.extension.layeranimation.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/extensions/revolution.extension.kenburn.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/extensions/revolution.extension.navigation.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/extensions/revolution.extension.migration.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/extensions/revolution.extension.parallax.min.js"></script>
	</body>
</html>