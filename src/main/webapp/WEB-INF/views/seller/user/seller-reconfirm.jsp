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
	    	var serialUpload = document.getElementsByName('serial-image')[0];
			serialHolder = document.getElementById('serial-holder');
	    	
	    	var state = document.getElementById('status');
	    	
	    	if (typeof window.FileReader === 'undefined') {
	  	  	  state.className = 'fail';
	  	  	} else {
	  	  	  state.className = 'success';
	  	  	  state.innerHTML = 'File API & FileReader available';
	  	  	}
	    	
	    	serialUpload.onchange = function (e) {
    		  e.preventDefault();
    		
    		  var file = serialUpload.files[0],
    		      reader = new FileReader();
    		  reader.onload = function (event) {
    		    var img = new Image();
    		    img.src = event.target.result;
    		    // note: no onload required since we've got the dataurl...I think! :)
    		      img.width = 250;
    	       serialHolder.innerHTML = '';
    	       serialHolder.appendChild(img);
    		  };
    		  reader.readAsDataURL(file);
    		
    		  return false;
    		};
    		
    		// ????????? ????????? ??????
        	$("#sellerReconfirm").click(function(event) {
        		event.preventDefault();
        		var formData = new FormData($('#sellerReconfirmForm')[0]);
        		//formData.append('id', '?????????');
        		
        		$.ajax({
    				type: 'POST',
    				url: '/rudisfarm/seller/seller-info',
    				enctype: 'multipart/form-data',
    				processData: false,
    				contentType: false,
    				cache: false,
    				data: formData, 
    				success: function(data) {
    					if(data) {
    						alert("????????? ?????? ???????????????. ?????? ??? ???????????? ?????? ????????? ????????? ???????????????.");
    						location.href = "/rudisfarm/seller/seller-info";
    					} else {
    						alert("????????? ??????????????????. ??????????????? ????????? ????????? ????????????.");
    					}
    				},
    				error: function(e) {
    					console.log("?????? ??????!");
    					console.log(e);
    				}
    			});
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
                 		<div class="col-lg-12">
	                        <div class="card">
	                            <div class="card-header">
	                                <strong>????????? ?????? ??????</strong>
	                            </div>
	                            <div class="card-body card-block">
		                            <form id="sellerReconfirmForm" enctype="multipart/form-data" class="form-horizontal">
		                            	<input type="hidden" name="EMAIL" value="${resultUserVO.getEMAIL()}"/>
	                                    <div class="row form-group">
	                                        <div class="col col-md-3">
	                                            <label class=" form-control-label"><strong>?????? ????????? ?????? ??????</strong></label>
	                                        </div>
	                                        <div class="col-12 col-md-9">
	                                        	<p class="form-control-static">
		                                        	<input class="au-input au-input--full" type="text" name="SERIAL" id="SERIAL" placeholder="????????? ?????? ?????? (XXX-XX-XXXXX)" value="${resultUserVO.getSERIAL()}">
	                                        	</p>
	                                        </div>
	                                    </div>
	                                    <div class="row form-group">
	                                        <div class="col col-md-3">
	                                            <label class=" form-control-label"><strong>?????? ????????? ?????? ?????? ?????? ??????</strong></label>
	                                        </div>
	                                        <div class="col-12 col-md-9">
	                                        	<p class="form-control-static">
		                                        	<div id="serial-holder"></div>
				                               		<input type="file" name="serial-image" id="serial-image"/>
				                        			<p id="status">File API &amp; FileReader API not supported</p>
	                                        	</p>
	                                        </div>
	                                    </div>
	                                    <div class="row form-group">
	                                        <div class="col col-md-3">
	                                            <label class=" form-control-label"><strong>?????? ??????</strong></label>
	                                        </div>
	                                        <div class="col-12 col-md-9">
	                                            <p class="form-control-static">
	                                            	<c:choose>
                                            		<c:when test="${resultUserVO.getSTATUS() eq 0}">
                                            			<span style="color: gray;"><strong>?????????</strong></span>
                                            			<small class="help-block form-text">?????? ???????????? ?????? ???????????????.</small>
                                            		</c:when>
                                            		<c:when test="${resultUserVO.getSTATUS() eq 1}">
                                            			<span style="color: green;"><strong>??????</strong></span>
                                            			<small class="help-block form-text">?????? ????????? ???????????????.</small>
                                            		</c:when>
                                            		<c:when test="${resultUserVO.getSTATUS() eq 2}">
                                            			<span style="color: red;"><strong>??????</strong></span>
                                            			<small class="help-block form-text">?????? ????????? ???????????? ?????? ????????? ???????????????. ??????????????? ??????????????? ???????????????.</small>
                                            		</c:when>
                                            		<c:when test="${resultUserVO.getSTATUS() eq 3}">
                                            			<span style="color: orange;"><strong>????????? ??????</strong></span>
                                            			<small class="help-block form-text">????????? ?????? ????????? ???????????? ???????????? ????????? ???????????????. ??????????????? ??????????????? ???????????????.</small>
                                            		</c:when>
                                            		<c:when test="${resultUserVO.getSTATUS() eq 4}">
		                                   				<span style="color: orangered;"><strong>????????? ??????</strong></span>
		                                    			<small class="help-block form-text">????????? ????????? ???????????? ?????? ????????? ???????????????. ?????? ????????? ???????????????. ??????????????? ??????????????? ???????????????.</small>
		                                    		</c:when>
	                                            	</c:choose>
	                                            </p>
	                                        </div>
	                                    </div>
                                    </form>
	                            </div>
	                            <div class="card-footer">
	                                <button type="button" class="btn btn-primary btn-sm" id="sellerReconfirm">
	                                    <i class="fa fa-dot-circle-o"></i> ????????? ??????
	                                </button>
	                                <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='seller-info'">
	                                	??????
	                                </button>
	                            </div>
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