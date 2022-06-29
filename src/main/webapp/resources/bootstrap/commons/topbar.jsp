<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
$(function() {
	$('#logoutLink').click(function() {
		if(Kakao.Auth.getAccessToken() != null) {
			logoutWithKakao();
		} else if(gapi.auth2.getAuthInstance().isSignedIn.get()) {//gapi.auth2.getAuthInstance().isSignedIn.get()
			logoutWithGoogle();
		} else {
			$('#logout').submit();
		}
	});
});
</script>
<div class="topbar">
	<div class="container">
		<div class="row">
			<sec:authorize access="isAuthenticated()">
			<div class="col-md-6">
				<div class="topbar-text">
					<span>${USER_ID}님 안녕하세요!</span> 
				</div>
			</div>
			<div class="col-md-6">
			</sec:authorize>
			<sec:authorize access="isAnonymous()">
			<div class="col-md-12">
			</sec:authorize>
				<div class="topbar-menu">
					<ul class="topbar-menu">
						<sec:authorize access="isAnonymous()">
						<li>
							<a href="/<c:url value="rudisfarm/login"/>">로그인</a>
						</li>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
						<li class="dropdown">
							<a href="#">회원가입</a>
							<ul class="sub-menu">
								<li><a href="/rudisfarm/join">일반</a></li>
								<li><a href="/rudisfarm/seller-join">판매자</a></li>
							</ul>
						</li>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
						<li class="dropdown">
							<a href="#">내 정보</a>
							<ul class="sub-menu">
								<li><a href="/rudisfarm/my-page/orders">주문 목록</a></li>
								<li><a href="/rudisfarm/my-page/reviewlist">리뷰 목록</a></li>
								<li><a href="/rudisfarm/my-page/my-info-modify-form">조회 및 수정</a></li>
							</ul>
						</li>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
						<li>
							<form:form id="logout" action="${pageContext.request.contextPath}/logout" method="POST"></form:form>
							<a id="logoutLink" style="cursor:pointer">로그아웃 </a>
						</li>
						</sec:authorize>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>