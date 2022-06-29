<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
    function a(){
    	$('a').click(function(){
    		console.log("<%=request.getRequestURI().split("/")[request.getRequestURI().split("/").length-1].split("\\.")[0]%>");
    		/*$(this).parent().toggleClass("active");*/
   		});
    	
    	if("#<%=request.getRequestURI().split("/")[request.getRequestURI().split("/").length-1].split("\\.")[0]%>"=="#<%=request.getRequestURI().split("/")[request.getRequestURI().split("/").length-1].split("\\.")[0]%>"){
			const ACTIVE_A = "#<%=request.getRequestURI().split("/")[request.getRequestURI().split("/").length-1].split("\\.")[0]%>";
			
			$(ACTIVE_A).parent().addClass("active");
			$(ACTIVE_A).parent().parent().parent().addClass("active");
			$(ACTIVE_A).parent().parent().parent().parent().parent().addClass("active");
    	}
    }
    window.onload=a;
</script>
 <aside class="menu-sidebar d-none d-lg-block">
    <div class="logo">
        <a href="/rudisfarm/seller/seller-index">
            <!-- <img src="<%= request.getContextPath() %>/resources/admin_bootstrap/images/icon/logo.png" alt="Cool Admin" />  -->
            판매자 관리 페이지
        </a>
    </div>
    <div class="menu-sidebar__content js-scrollbar1">
        <nav class="navbar-sidebar">
            <ul class="list-unstyled navbar__list">
                <li class="has-sub">
                    <a class="js-arrow" href="#">
                        <i class="fas fa-archive"></i>상품</a>
                    <ul class="list-unstyled navbar__sub-list js-sub-list">
                        <li>
                            <a href="/rudisfarm/seller/seller-product-manage" id="seller-product-manage">상품 관리</a>
                        </li>
                        <li>
                            <a href="/rudisfarm/seller/seller-product-manage-add-form" id="seller-product-manage-add-form">상품 등록</a>
                        </li>
                        <li>
                            <a href="/rudisfarm/seller/seller-product-manage-premium-form" id="seller-product-manage-premium-form">프리미엄</a>
                        </li>
                       	<li>
                            <a href="/rudisfarm/seller/seller-reviewlist-manage" id="seller-reviewlist-manage">리뷰 조회</a>
                        </li>
                    </ul>
                </li>
                <li class="has-sub">
                    <a class="js-arrow" href="#">
                        <i class="fas fa-shopping-cart"></i>주문</a>
                    <ul class="list-unstyled navbar__sub-list js-sub-list">
                       <li>
                            <a href="/rudisfarm/seller/seller-orderslist-manage" id="seller-orderslist-manage">주문 목록</a>
                        </li>
                        <li>
                            <a href="/rudisfarm/seller/seller-deliverylist-manage" id="seller-deliverylist-manage">배송 처리 목록</a>
                        </li>
                        <li>
                            <a href="/rudisfarm/seller/seller-payment-manage" id="seller-payment-manage">주문/결제 승인 내역</a>
                        </li>
                        <li>
                            <a href="/rudisfarm/seller/seller-cancelpayment-manage" id="seller-cancelpayment-manage">주문/결제 취소 내역</a>
                        </li>
                    </ul>
                </li>
                <li class="has-sub">
                    <a class="js-arrow" href="#">
                        <i class="fas fa-refresh"></i>교환</a>
                    <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                        <li>
                            <a href="/rudisfarm/seller/seller-reqexchangeorders-manage" id="seller-reqexchangeorders-manage">교환 요청 목록</a>
                        </li>
                        <li>
                            <a href="/rudisfarm/seller/seller-exchangecompleteList-manage" id="seller-exchangecompletelist-manage">교환 처리</a>
                        </li>
                        <li>
                            <a href="/rudisfarm/seller/seller-exchangeimpossibleList-manage" id="seller-exchangeimpossiblelist-manage">교환 불가</a>
                        </li>
                    </ul>
                </li>
                <li class="has-sub">
                    <a class="js-arrow" href="#">
                        <i class="fas fa-times"></i>반품</a>
                    <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                        <li>
                            <a href="/rudisfarm/seller/seller-reqreturnorders-manage" id="seller-reqreturnorders-manage">반품 요청 목록</a>
                        </li>
                        <li>
                            <a href="/rudisfarm/seller/seller-returncompleteList-manage" id="seller-returncompletelist-manage">반품 처리 목록</a>
                        </li>
                        <li>
                            <a href="/rudisfarm/seller/seller-returnimpossibleList-manage" id="seller-returnimpossiblelist-manage">반품 불가 목록</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="/rudisfarm/seller/seller-sellerincome-manage" id="seller-sellerincome-manage">
                        <i class="fas fa-won"></i>정산</a>
                </li>
            </ul>
        </nav>
    </div>
</aside>