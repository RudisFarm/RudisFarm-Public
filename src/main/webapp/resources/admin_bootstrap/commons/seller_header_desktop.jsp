<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<header class="header-desktop">
    <div class="section__content section__content--p30">
        <div class="container-fluid">
            <div class="header-wrap">
                <div>
               		<p>${COMPANY_NAME}</p>
                </div>
                <div class="header-button">
                    <div>              
                	</div>
                    <div class="account-wrap">
                        <div class="account-item clearfix js-item-menu">
                        	<div class="image">
								<img src="<%= request.getContextPath() %>/resources/images/images.jpg" alt="프로필 이미지">
							</div>
                            <div class="content">
                                <a class="js-acc-btn" href="#">${USER_NAME}</a>
                            </div>
                            <div class="account-dropdown js-dropdown">
                                <div class="info clearfix">
                                    <div class="content" style="margin-left: 0px;">
                                        <h5 class="name">
                                            <a href="#">${USER_NAME}</a>
                                        </h5>
                                        <span class="email">${EMAIL}</span>
                                    </div>
                                </div>
                                <div class="account-dropdown__body">
                                    <div class="account-dropdown__item">
                                        <a href="seller-info">
                                            <i class="zmdi zmdi-account"></i>내 정보</a>
                                    </div>
                                </div>
                                <div class="account-dropdown__footer">
                                	<form:form id="seller-logout" action="${pageContext.request.contextPath}/logout" method="POST"></form:form>
                                    <a id="logoutLink" href="#" onclick="$('#seller-logout').submit();">
                                        <i class="zmdi zmdi-power"></i>로그아웃</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>