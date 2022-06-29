<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <aside class="menu-sidebar d-none d-lg-block">
    <div class="logo">
        <a href="./seller-index">
            <!-- <img src="<%= request.getContextPath() %>/resources/admin_bootstrap/images/icon/logo.png" alt="Cool Admin" />  -->
            판매자 관리 페이지
        </a>
    </div>
    <div class="menu-sidebar__content js-scrollbar1">
        <nav class="navbar-sidebar">
            <ul class="list-unstyled navbar__list">
                <li class="active has-sub">
                    <a class="js-arrow" href="seller-product-manage">
                        <i class="fas fa-archive"></i>상품</a>
                    <ul class="list-unstyled navbar__sub-list js-sub-list">
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
                    <a href="seller-payment-manage">
                        <i class="fas fa-table"></i>결제</a>
                </li>
            </ul>
        </nav>
    </div>
</aside>