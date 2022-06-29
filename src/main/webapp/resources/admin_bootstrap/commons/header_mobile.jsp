<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header class="header-mobile d-block d-lg-none">
    <div class="header-mobile__bar">
        <div class="container-fluid">
            <div class="header-mobile-inner">
                <a class="logo" href="/rudisfarm/admin/admin-index">
                    <img src="<%= request.getContextPath() %>/resources/images/캡처1.PNG" alt="Admin 홈페이지" style="width:300px;"/>
                </a>
                <button class="hamburger hamburger--slider" type="button">
                    <span class="hamburger-box">
                        <span class="hamburger-inner"></span>
                    </span>
                </button>
            </div>
        </div>
    </div>
    <nav class="navbar-mobile">
        <div class="container-fluid">
            <ul class="navbar-mobile__list list-unstyled">
                <li class="has-sub">
                    <a class="js-arrow" href="#">
                        <i class="fas fa-users"></i>회원</a>
                    <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                            
						<li>
                            <a href="/rudisfarm/admin/admin-buyerlist-manage">&nbsp;&nbsp;<i class="fas fa-caret-right"></i>구매자 목록</a>
                        </li>
                        <li>
                            <a href="/rudisfarm/admin/admin-seller-manage">&nbsp;&nbsp;<i class="fas fa-caret-right"></i>판매자 목록</a>
                        </li>
                    </ul>
                </li>

                <li class="has-sub">
                    <a class="js-arrow" href="#">
                        <i class="fas fa-archive"></i>상품</a>
                    <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                        <li>
                            <a href="/rudisfarm/admin/admin-productlist-manage">&nbsp;&nbsp;<i class="fas fa-caret-right"></i>판매자 상품 관리</a>
                        </li>
                        <li>
                            <a href="/rudisfarm/admin/admin-keyword-manage">&nbsp;&nbsp;<i class="fas fa-caret-right"></i>상품 키워드 관리</a>
                        </li>
                    </ul>
                </li>
               <li>
                    <a href="/rudisfarm/admin/admin-orders-manage">
                        <i class="fas fa-shopping-cart"></i>주문</a>
                </li>
                <li class="has-sub">
                    <a class="js-arrow" href="#">
                        <i class="fas fa-credit-card"></i>결제</a>
                    <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                    <li>
                    	<a href="/rudisfarm/admin/admin-paymentlist-manage">
                        	<i class="fas fa-caret-right"></i>완료된 결제 목록</a>
                	</li>
                	<li>
                    	<a href="/rudisfarm/admin/admin-canceledpaymentlist-manage">
                        	<i class="fas fa-caret-right"></i>취소된 결제 목록</a>
                	</li>
                    </ul>
                </li>
                <li>
                    <a href="/rudisfarm/admin/admin-reviewlist-manage">
                        <i class="fas fa-pencil-square-o"></i>리뷰</a>
                </li>
                <li>
                    <a href="/rudisfarm/admin/admin-sellerincome-manage">
                        <i class="fas fa-won"></i>정산</a>
                </li>
            </ul>
        </div>
    </nav>
</header>