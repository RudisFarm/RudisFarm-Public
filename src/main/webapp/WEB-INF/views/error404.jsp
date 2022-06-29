<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="au theme template">
	    <meta name="author" content="Hau Nguyen">
	    <meta name="keywords" content="au theme template">
	    <jsp:include page="/resources/admin_bootstrap/commons/fontfaces_css.jsp"/>
	    <jsp:include page="/resources/admin_bootstrap/commons/bootstrap_css.jsp"/>
	    <jsp:include page="/resources/admin_bootstrap/commons/vendor_css.jsp"/>
	    <jsp:include page="/resources/admin_bootstrap/commons/main_css.jsp"/>
	    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	   
	    
	    <title>존재하지 않는 페이지 - 루디스팜</title>
	</head>
	<body class="animsition">
	    <div class="page-wrapper">
	    	<div class="page-content--bge5">
	            <div class="container">
	                <div class="login-wrap" style="max-width: 1000px">
	                    <div class="login-content">
	                        <div class="row">
	                        	<div class="col">
	                        		<h1 class="pb-2 display-4"><i class="fa fa-warning"></i> 존재하지 않는 페이지</h1>
	                        	</div>
	                        </div>
	                        <div class="row">
	                        	<div class="col">
	                        		<div class="jumbotron">
				                    	<p>루디스팜 서비스 이용에 불편을 드려 죄송합니다. 본 페이지는 존재하지 않는 페이지입니다.</p>
			                        </div>
	                        	</div>
	                        </div>
	                        <div class="row">
	                        	<div class="col">
			                    	<button type="button" class="btn btn-link" onclick="location.href='${url}'">
                                           <i class="fa fa-link"></i>&nbsp; 메인 페이지로 돌아가기</button>
                    	    	</div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    
		<jsp:include page="/resources/admin_bootstrap/commons/js.jsp"/>
	</body>	
</html>

