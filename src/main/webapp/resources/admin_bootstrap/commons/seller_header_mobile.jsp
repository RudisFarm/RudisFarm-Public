<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header class="header-mobile d-block d-lg-none">
    <div class="header-mobile__bar">
        <div class="container-fluid">
            <div class="header-mobile-inner">
                <a class="logo" href="/rudisfarm/seller/seller-index">
<%--                     <img src="<%= request.getContextPath() %>/resources/admin_bootstrap/images/icon/logo.png" alt="CoolAdmin" /> --%>
                	판매자 관리 페이지
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
                        <i class="fas fa-archive"></i>상품</a>
                    <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                        <li>
                            <a href="/rudisfarm/seller/seller-product-manage">상품 관리</a>
                        </li>
                        <li>
                            <a href="/rudisfarm/seller/seller-product-manage-add-form">상품 등록</a>
                        </li>
                        <li>
                            <a href="/rudisfarm/seller/seller-product-manage-premium-form">프리미엄</a>
                        </li>
                        <li>
                            <a href="/rudisfarm/seller/seller-reviewlist-manage">리뷰 조회</a>
                        </li>
                    </ul>
                </li>
                <li class="has-sub">
                    <a class="js-arrow" href="#">
                        <i class="fas fa-shopping-cart"></i>주문</a>
                    <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                       <li>
                            <a href="/rudisfarm/seller/seller-orderslist-manage">주문 목록</a>
                        </li>
                        <li>
                            <a href="/rudisfarm/seller/seller-deliverylist-manage">배송 처리 목록</a>
                        </li>
                        <li>
                            <a href="/rudisfarm/seller/seller-payment-manage">주문/결제 승인 내역</a>
                        </li>
                        <li>
                            <a href="/rudisfarm/seller/seller-cancelpayment-manage">주문/결제 취소 내역</a>
                        </li>
                    </ul>
                </li>
                <li class="has-sub">
                    <a class="js-arrow" href="#">
                        <i class="fas fa-refresh"></i>교환</a>
                    <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                        <li>
                            <a href="/rudisfarm/seller/seller-reqexchangeorders-manage">교환 요청 목록</a>
                        </li>
                        <li>
                            <a href="/rudisfarm/seller/seller-exchangecompleteList-manage">교환 처리</a>
                        </li>
                        <li>
                            <a href="/rudisfarm/seller/seller-exchangeimpossibleList-manage">교환 불가</a>
                        </li>
                    </ul>
                </li>
                <li class="has-sub">
                    <a class="js-arrow" href="#">
                        <i class="fas fa-times"></i>반품</a>
                    <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                        <li>
                            <a href="/rudisfarm/seller/seller-reqreturnorders-manage">반품 요청 목록</a>
                        </li>
                        <li>
                            <a href="/rudisfarm/seller/seller-returncompleteList-manage">반품 처리 목록</a>
                        </li>
                        <li>
                            <a href="/rudisfarm/seller/seller-returnimpossibleList-manage">반품 불가 목록</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="/rudisfarm/seller/seller-sellerincome-manage">
                        <i class="fas fa-won"></i>정산</a>
                </li>
            </ul>
        </div>
    </nav>
</header>