<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">


<title>Admin 페이지 로그인</title>

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



    <!-- <style>
        body {margin: 0; padding: 0; font-family: 'Times New Roman', serif; }
        a {text-decoration: none; }
        img {border: 0;}
		td{padding-left:10px;}

        #main_header {
			margin:20px;
			text-align: center;
		}
		
		#main_section {
            text-align: center;
        }
    
        #main_section article {
			height: auto;
			width:300px;
			margin: 0 auto;
        	margin-bottom: 10px;
			box-sizing:border-box;
            padding: 20px;
            padding-bottom:0px;
            border: 1px solid #333;
        }

        #main_footer {
            margin: 0 auto;
            margin-bottom: 10px;
            box-sizing: border-box;
            padding: 10px;
			padding-bottom: 0px;
            border: 0px solid #333;
            text-align: center;
        }
    </style> -->



</head>





<body class="animsition">
    <div class="page-wrapper">
        <div class="page-content--bge5">
            <div class="container">
                <div class="login-wrap">
                    <div class="login-content">
                        <div class="login-logo">
                            <a href="/rudisfarm/admin-login">
                                <img src="<%= request.getContextPath() %>/resources/images/캡처1.PNG" alt="Login" style="width:300px">
                            </a>
                        </div>
                        <div class="login-form">
                            <form action="admin-find" method="post">
                                
                                <div class="form-group">
                                    <label>이메일</label>
                                    <input id=email class="au-input au-input--full" type="email" name="email" placeholder="E-Mail" required maxlength="50">
                                </div>
                                <button class="au-btn au-btn--block au-btn--blue m-b-20" type="submit">메일로 ID, 비밀번호 전송</button>
                            </form>
                            <!-- <div class="register-link">
                                <p>
                                    	기본 이름은
                                    <a href="javascript:putName();">관리자</a>, 기본 이메일은 <a href="javascript:putEmail();">이메일</a>
                                </p>
                            </div> -->
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




<!-- 
<form action="admin-index" method="post">
<header id="main_header">
<div class="container-fluid">
  <a href="javascript:location.reload()"><img src="<%= request.getContextPath() %>/resources/images/캡처1.PNG" alt="Login" style="width:300px"></a>
  <br>
  </div>
</header>
        <section id="main_section">
            <article class="main_article">
			<table>
			<tr><td>
                <p>&nbsp;&nbsp;I&nbsp;D : &nbsp;&nbsp;<input type="text" name="id" required maxlength="20" autofocus="autofocus"></p></td></tr>
				<tr><td><p>PASS : <input type="password" name="pass" required maxlength="20"><br><br></p></td></tr>
				<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Login" style="height:40px; width:80px;"></td></tr>
				</table>
            </article>
        </section>
    <footer id="main_footer">
        <p>Copyright &copy; 2021 RudisFarm. All rights reserved.</p>
    <address>Contact list - 김똥개 : 010-1111-2222</address>
    </footer>
	</form>  -->
</body>









</html>