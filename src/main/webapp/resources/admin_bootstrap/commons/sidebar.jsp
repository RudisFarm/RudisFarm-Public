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
        <a href="/rudisfarm/admin/admin-index">
            <img src="<%= request.getContextPath() %>/resources/images/캡처1.PNG" alt="Admin 홈페이지"/>
        </a>
    </div>
    <div class="menu-sidebar__content js-scrollbar1">
        <nav class="navbar-sidebar">
            <ul class="list-unstyled navbar__list">
                <li class="has-sub">
                    <a class="js-arrow" href="#">
                        <i class="fas fa-users"></i>회원</a>
                    <ul class="list-unstyled navbar__sub-list js-sub-list">
                    	<li>
                            <a href="/rudisfarm/admin/admin-buyerlist-manage" id="admin-buyerlist-manage"><i class="fas fa-caret-right"></i>구매자 목록</a>
                        </li>
                        <li>
                            <a href="/rudisfarm/admin/admin-seller-manage" id="admin-seller-manage"><i class="fas fa-caret-right"></i>판매자 목록</a>
                        </li>
                    </ul>
                </li>
                <li class="has-sub">
                    <a class="js-arrow" href="#">
                        <i class="fas fa-archive"></i>상품</a>
                    <ul class="list-unstyled navbar__sub-list js-sub-list">
                        <li>
                            <a href="/rudisfarm/admin/admin-product-manage" id="admin-product-manage"><i class="fas fa-caret-right"></i>판매자 상품 관리</a>
                        </li>
                        <li>
                            <a href="/rudisfarm/admin/admin-keyword-manage" id="admin-keyword-manage"><i class="fas fa-caret-right"></i>상품 키워드 관리</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="/rudisfarm/admin/admin-orders-manage" id="admin-orders-manage">
                        <i class="fas fa-shopping-cart"></i>주문</a>
                </li>
                <li class="has-sub">
                	<a class="js-arrow" href="#">
                        <i class="fas fa-credit-card"></i>결제</a>
                    <ul class="list-unstyled navbar__sub-list js-sub-list">
	                    <li>
	                    	<a href="/rudisfarm/admin/admin-paymentlist-manage" id="admin-paymentlist-manage">
	                        	<i class="fas fa-caret-right"></i>완료된 결제 목록</a>
	                	</li>
	                	<li>
	                    	<a href="/rudisfarm/admin/admin-canceledpaymentlist-manage" id="admin-canceledpaymentlist-manage">
	                        	<i class="fas fa-caret-right"></i>취소된 결제 목록</a>
	                	</li>
                	</ul>
                </li>
                <li>
                    <a href="/rudisfarm/admin/admin-reviewlist-manage" id="admin-reviewlist-manage">
                        <i class="fas fa-pencil-square-o"></i>리뷰</a>
                </li>
                <li>
                    <a href="/rudisfarm/admin/admin-sellerincome-manage" id="admin-sellerincome-manage">
                        <i class="fas fa-won"></i>정산</a>
                </li>
            </ul>
        </nav>
    </div>
</aside>