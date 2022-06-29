<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript">
    function a(){
    	$('a').click(function(){
    		console.log("<%=request.getRequestURI()%>");
    		$(this).parent().toggleClass("active");
    		});
    	if("#<%=request.getRequestURI().substring(33,48).split("/")[1]%>"=="#<%=request.getRequestURI().substring(33,48).split("/")[1]%>"){
    		$("#<%=request.getRequestURI().substring(33,48).split("/")[1]%>").parent().addClass("active");
    		$("#<%=request.getRequestURI().substring(33,48).split("/")[1]%>").parent().parent().parent().addClass("active");
    		$("#<%=request.getRequestURI().substring(33,48).split("/")[1]%>").parent().parent().parent().parent().addClass("active");
    	}
    }
    window.onload=a;
	</script>
 <aside class="menu-sidebar d-none d-lg-block">
    <div class="logo">
        <a href="/rudisfarm/admin-index">
            <img src="<%= request.getContextPath() %>/resources/images/캡처1.PNG" alt="Admin 홈페이지"/>
        </a>
    </div>
    <div class="menu-sidebar__content js-scrollbar1">
        <nav class="navbar-sidebar">
            <ul class="list-unstyled navbar__list">
                <li class="has-sub">
                    <a class="js-arrow" href="#">
                        <i class="fas fa-tachometer-alt"></i>회원 관리</a>
                    <ul class="list-unstyled navbar__sub-list js-sub-list">

						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">고객
								<span class="caret"></span>
							</a>
								<div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 44px, 0px); top: 0px; left: 0px; will-change: transform;">
								<a class="dropdown-item" href="/rudisfarm/admin-buyerlist-manage" id="admin-buyer">정보</a>
								<a class="dropdown-item" href="/rudisfarm/admin-cart-manage" id="admin-cart-">장바구니</a>
							</div>
						</li>
						
                        <li>
                            <a href="/rudisfarm/admin-sellerlist-manage" id="admin-selle">판매자</a>
                        </li>
                    </ul>
                </li>
                <li class="has-sub">
                    <a class="js-arrow" href="#">
                        <i class="fas fa-tachometer-alt"></i>상품 관리</a>
                    <ul class="list-unstyled navbar__sub-list js-sub-list">

                        <li>
                            <a href="/rudisfarm/admin-productlist-manage" id="admin-pr">상품</a>
                        </li>
						
                        <li>
                            <a href="/rudisfarm/admin-keyword-manage" id="ad">키워드</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="/rudisfarm/admin-orderlist-manage" id="admin-ord">
                        <i class="fas fa-chart-bar"></i>주문 관리</a>
                </li>
                <li>
                    <a href="/rudisfarm/admin-paymentlist-manage" id="admin-pa">
                        <i class="fas fa-table"></i>결제 관리</a>
                </li>
                <li>
                    <a href="/rudisfarm/admin-reviewlist-manage" id="admin-rev">
                        <i class="far fa-check-square"></i>리뷰 관리</a>
                </li>
                <li>
                    <a href="/rudisfarm/admin-qnalist-manage" id="admin-qnalis">
                        <i class="fas fa-calendar-alt"></i>QNA 관리</a>
                </li>

            </ul>
        </nav>
    </div>
</aside>