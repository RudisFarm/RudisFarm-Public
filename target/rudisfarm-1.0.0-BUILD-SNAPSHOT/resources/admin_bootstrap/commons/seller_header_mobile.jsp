<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header class="header-mobile d-block d-lg-none">
    <div class="header-mobile__bar">
        <div class="container-fluid">
            <div class="header-mobile-inner">
                <a class="logo" href="./seller-index">
                    <img src="<%= request.getContextPath() %>/resources/admin_bootstrap/images/icon/logo.png" alt="CoolAdmin" />
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
                        <i class="fas fa-tachometer-alt"></i>상품</a>
                    <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                        <li>
                            <a href="seller-product-manage">목록 관리</a>
                        </li>
                        <li>
                            <a href="#">리뷰 관리</a>
                        </li>
                        <li>
                            <a href="#">질문 조회 및 답변</a>
                        </li>
                    </ul>
                </li>
                 <li>
                    <a href="#">
                        <i class="fas fa-chart-bar"></i>주문</a>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-table"></i>결제</a>
                </li>
            </ul>
        </div>
    </nav>
</header>