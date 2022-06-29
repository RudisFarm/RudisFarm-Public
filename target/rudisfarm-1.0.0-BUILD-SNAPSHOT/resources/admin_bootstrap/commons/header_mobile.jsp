<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header class="header-mobile d-block d-lg-none">
    <div class="header-mobile__bar">
        <div class="container-fluid">
            <div class="header-mobile-inner">
                <a class="logo" href="/rudisfarm/admin-index">
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
                        <i class="fas fa-tachometer-alt"></i>회원 관리</a>
                    <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                        <li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">고객
								<span class="caret"></span>
							</a>
								<div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 44px, 0px); top: 0px; left: 0px; will-change: transform;">
								<a class="dropdown-item" href="/rudisfarm/admin-buyerlist-manage">정보</a>
								<a class="dropdown-item" href="/rudisfarm/admin-cart-manage">장바구니</a>
							</div>
						</li>
						
                        <li>
                            <a href="/rudisfarm/admin-sellerlist-manage">판매자</a>
                        </li>
                    </ul>
                </li>

                <li class="has-sub">
                    <a class="js-arrow" href="#">
                        <i class="fas fa-copy"></i>상품관리</a>
                    <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                        <li>
                            <a href="/rudisfarm/admin-productlist-manage">상품</a>
                        </li>
						
                        <li>
                            <a href="/rudisfarm/admin-keyword-manage">키워드</a>
                        </li>
                    </ul>
                </li>
               <li>
                    <a href="/rudisfarm/admin-orderlist-manage">
                        <i class="fas fa-chart-bar"></i>주문 관리</a>
                </li>
                <li>
                    <a href="/rudisfarm/admin-paymentlist-manage">
                        <i class="fas fa-table"></i>결제 관리</a>
                </li>
                <li>
                    <a href="/rudisfarm/admin-reviewlist-manage">
                        <i class="far fa-check-square"></i>리뷰 관리</a>
                </li>
                <li>
                    <a href="/rudisfarm/admin-qnalist-manage">
                        <i class="fas fa-calendar-alt"></i>QNA 관리</a>
                </li>
            </ul>
        </div>
    </nav>
</header>