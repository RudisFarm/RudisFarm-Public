<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
    <title>관리자 카테고리 관리</title>

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
	<!-- JS -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
	<script>
		var kategorie = new Map();
		
		$(function() {
			
			// 카테고리 값 가져오기
			$.ajax({
				type : 'POST',
				url : '/rudisfarm/product-type',
				dataType : 'json',
				contentType : 'application/json; charset=utf-8;',
				async: false,
				success : function(data) {
					$.each(data, function(index, key) {
						$("#TYPE1").append("<option value="+index+">"+index+"</option>");
						kategorie.set(index, key);
					});
				},
				error : function(data) {
					console.log("에러 발생!");
					console.log(data);
				}
			});
			
			$("#selboxDirect").hide();
			$("#add").hide();
			$("#delete").hide();
			
			$("#TYPE1").change( function() {
				var value = $("#TYPE1 option:selected").val();
				$('#TYPE2').children('option:not(:first)').remove();
				$("#selboxDirect").hide();
				$("#add").hide();
				$("#delete").hide();
				
				for(var i in kategorie.get(value)) {	
					let type2 = kategorie.get(value)[i]["type2"];
					$("#TYPE2").append("<option value="+type2+">"
							+type2+"</option>");
				}
				
				if(value != "") {
					$("#TYPE2").append("<option value=direct>직접입력</option>");
				}
			});
			
			// 소분류가 바뀌었을 때
			$("#TYPE2").change( function() {
				
				if($("#TYPE2").val() == "" || $("#TYPE2").val() == "direct") {
					$("#delete").hide();
				} else {
					$("#delete").show();
				}
				
				if($("#TYPE2").val() == "direct") { 
					$("#selboxDirect").show();
					$("#add").show();
				}  
				else { 
					$("#selboxDirect").hide(); 
					$("#add").hide();
				}
			});
			
		})	
		
		//카테고리 정보 새로고침
		function reloadTr(){
			$.ajax({
				type : 'POST',
				url : '/rudisfarm/product-type',
				dataType : 'json',
				contentType : 'application/json; charset=utf-8;',
				async: false,
				success : function(data) {
					var tr;
					$('#categoryInfo').children().remove();
					$('#count').text("");
					$('#count').text("현재 카테고리 갯수 : "+Object.keys(data).length);
					kategorie.clear();
					
					$.each(data, function(index, key) {
						kategorie.set(index, key);
						
						tr="";
						for(var i in key) {
							let type2 = key[i]["type2"];
							tr = tr + '<option>'+type2+'</option>';
						}
						$("#categoryInfo").append(
                            '<tr>'+
                                '<td>'+
                                    '<span class="role admin">'+index+'</span>'+
                                '</td>'+
                                '<td>'+
                                    '<div class="rs-select2--trans rs-select2--sm" style="margin: auto;">'+
                                        '<select name="property">'+
                                        	tr+
                                        '</select>'+
                                        '<div class="dropDownSelect2"></div>'+
                                    '</div>'+
                                '</td>'+
                                '<td>'+key.length+'개</td>'+
                            '</tr>'
						);
					});
				},
				error : function(data) {
					console.log("에러 발생!");
					console.log(data);
				}
			});			
		}
		
		//대분류 새로고침
		function reloadType(){
			$.ajax({
				type : 'POST',
				url : '/rudisfarm/product-type',
				dataType : 'json',
				contentType : 'application/json; charset=utf-8;',
				async: false,
				success : function(data) {
					kategorie.clear();
					$('#TYPE2').children('option:not(:first)').remove();
					$('#TYPE1').children('option:not(:first)').remove();
					$.each(data, function(index, key) {
						kategorie.set(index, key);
						$("#TYPE1").append("<option value="+index+">"+index+"</option>");
					});
				},
				error : function(data) {
					console.log("에러 발생!");
					console.log(data);
				}
			});
		}
		
		function addType1(form){
			
			if(!form.createType1.value) {
				alert("대분류를 입력해 주십시오.");
				return false;
			}
			if(!form.createType2.value) {
				alert("소분류를 입력해 주십시오.");
				return false;
			}
			
			$.ajax({
				type: 'post',
				url: '/rudisfarm/product-type1-add', 
				dataType: 'json',
				contentType: "application/json; charset=utf-8;",
				data : JSON.stringify({
					type1:form.createType1.value,
					type2:form.createType2.value
				}),
				success: function(data) {
					if(data > 0) {
						alert("중복되는 대분류가 있습니다.");
					} else {
						alert("등록에 성공하였습니다.");
						document.getElementById("createType1").value = null;
						document.getElementById("createType2").value = null;
						reloadTr();
						reloadType();
						$("#selboxDirect").hide();
						$("#add").hide();
						$("#delete").hide();
					}
				},
				error: function(e) {
					console.log("에러 발생!");
					console.log(e);
				}
			});						
		}
		
		function addType2(form){
			var typeOne = form.TYPE1.value;
			
			if(!form.TYPE1.value) {
				alert("대분류를 선택해 주십시오.");
				return false;
			}
			if(!form.TYPE2.value) {
				alert("소분류를 선택해 주십시오.");
				return false;
			}
			if(form.TYPE2.value == "direct" && form.selboxDirect.value == "") {
				alert("소분류를 입력해 주십시오.");
				return false;
			}
			
			$.ajax({
				type: 'post',
				url: '/rudisfarm/product-type2-add', 
				dataType: 'json',
				contentType: "application/json; charset=utf-8;",
				data : JSON.stringify({
					type1 : form.TYPE1.value,
					type2 : form.selboxDirect.value
				}),
				success: function(data) {
					if(data > 0) {
						alert("중복되는 소분류가 있습니다.");
					} else {
						alert("등록에 성공하였습니다.");
						reloadType();
						reloadTr();
						$("#TYPE1").val(typeOne).prop("selected", true);
						
						for(var i in kategorie.get(typeOne)) {	
							let type2 = kategorie.get(typeOne)[i]["type2"];
							$("#TYPE2").append("<option value="+type2+">"
									+type2+"</option>");
						}
						
						$("#TYPE2").append("<option value=direct>직접입력</option>");
						$("#TYPE2").val("direct").prop("selected", true);
						document.getElementById("selboxDirect").value = null;
					}
				},
				error: function(e) {
					console.log("에러 발생!");
					console.log(e);
				}
			});						
		}
		
		function deleteType(form){
			var typeOne = form.TYPE1.value;
			
			if(!form.TYPE1.value) {
				alert("대분류를 선택해 주십시오.");
				return false;
			}
			if(!form.TYPE2.value) {
				alert("소분류를 선택해 주십시오.");
				return false;
			}
			
			$.ajax({
				type: 'delete',
				url: '/rudisfarm/product-type-delete', 
				dataType: 'json',
				contentType: "application/json; charset=utf-8;",
				data : JSON.stringify({
					type1 : form.TYPE1.value,
					type2 : form.TYPE2.value
				}),
				success: function(data) {
					if(data > 0) {
						alert("삭제에 성공하였습니다.");
						reloadType();
						reloadTr();
						
						if(kategorie.get(typeOne)) {
							$("#TYPE1").val(typeOne).prop("selected", true);
							
							for(var i in kategorie.get(typeOne)) {	
								let type2 = kategorie.get(typeOne)[i]["type2"];
								$("#TYPE2").append("<option value="+type2+">"
										+type2+"</option>");
							}
							
							$("#TYPE2").append("<option value=direct>직접입력</option>");
							$("#TYPE2").val("").prop("selected", true);
						} else {
							$("#TYPE1").val("").prop("selected", true);
							$("#selboxDirect").hide();
							$("#add").hide();
							$("#delete").hide();
						}
						
					} else {
						alert("카테고리를 사용하고 있는 상품이 있습니다.");
					}
				},
				error: function(e) {
					console.log("에러 발생!");
					console.log(e);
				}
			});						
		}
	</script>
</head>

<body class="animsition">
    <div class="page-wrapper">
        <jsp:include page="/resources/admin_bootstrap/commons/header_mobile.jsp"/>

        <jsp:include page="/resources/admin_bootstrap/commons/sidebar.jsp"/>

        <div class="page-container">
            <jsp:include page="/resources/admin_bootstrap/commons/header_desktop.jsp"/>

            <!-- MAIN CONTENT-->
            <div class="main-content">
            
            	<div class="container-fluid">
                    <div class="card" style="text-align: center;">
                        <div class="card-header">
                            <strong>대분류 추가</strong>
                        </div>
                        <div class="card-body card-block" style="margin: auto;">
                            <form class="form-inline" name="createForm">
                                <div class="form-group">
                                    <label for="createType1" class="pr-1  form-control-label">대분류</label>
                                    <input type="text" id="createType1" name="createType1" placeholder="대분류..." class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="createType2" class="px-1  form-control-label">소분류</label>
                                    <input type="text" id="createType2" name="createType2" placeholder="소분류..." class="form-control">
                                </div>
                                &nbsp;
	                         	<div>
		                            <button type="button" class="btn btn-primary btn-sm" onclick="addType1(this.form)">
		                                <i class="fa fa-dot-circle-o"></i> 추가
		                            </button>
		                        </div>
                            </form>
                        </div>
                    </div>            	

                    <div class="card" style="text-align: center;">
                        <div class="card-header">
                            <strong>소분류 개별추가, 삭제</strong>
                        </div>
                        <div class="card-body card-block" style="margin: auto;">
                            <form class="form-inline" name="createForm">
                            
                                            <div class="row form-group">
                                                <div class="col-12 col-md-9">
                                                    <select class="form-control" id="TYPE1" name="TYPE1">
                                                        <option value="">------</option>
                                                    </select>
                                                </div>
                                            </div>
											&nbsp;
                                            <div class="row form-group">
                                                <div class="col-12 col-md-9">
                                                    <select class="form-control" id="TYPE2" name="TYPE2">
                                                        <option value="">------</option>
                                                    </select>
                                                </div>
                                            </div>
                                            &nbsp;
                                            <div class="form-group">
                                            	<input type="text" id="selboxDirect" class="form-control"/>
                                            </div>
                                &nbsp;
	                         	<div>
		                            <button type="button" class="btn btn-primary btn-sm" onclick="addType2(this.form)"  id="add">
		                                <i class="fa fa-dot-circle-o"></i>추가
		                            </button>
		                            <button type="button" class="btn btn-danger btn-sm" onclick="deleteType(this.form)" id="delete">
                                        <i class="fa fa-ban"></i> 삭제
                                    </button>
		                        </div>
                            </form>
                        </div>
                    </div>    

	                <div class="user-data m-b-30">
	                    <h3 class="title-3 m-b-30">
	                        <i class="zmdi zmdi-account-calendar"></i>카테고리 정보</h3>
	                    <div class="filters m-b-45" id="count">
	                                   현재 카테고리 갯수 : ${fn:length(type)}
	                    </div>
	                    <div class="table-responsive table-data">
	                        <table class="table" style="text-align: center;">
	                            <thead>
	                                <tr>
	                                    <td>대분류</td>
	                                    <td>소분류</td>
	                                    <td>소분류 갯수</td>
	                                </tr>
	                            </thead>
	                            <tbody id="categoryInfo">
	                            	<c:forEach var="types" items="${type}"> 
		                                <tr>
		                                    <td>
		                                        <span class="role admin">${types.key}</span>
		                                    </td>
		                                    <td>
		                                        <div class="rs-select2--trans rs-select2--sm" style="margin: auto;">
		                                            <select name="property">
		                                            	<c:forEach var="type2" items="${types.value}"> 
		                                                <option>${type2.TYPE2}</option>
		                                                </c:forEach>
		                                            </select>
		                                            <div class="dropDownSelect2"></div>
		                                        </div>
		                                    </td>
		                                    <td>${fn:length(types.value)}개</td>
		                                </tr>
	                                </c:forEach>

	                            </tbody>
	                        </table>
	                    </div>
	                </div>	
	                				                                
	            </div>
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

</body>
</html>