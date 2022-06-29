<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header class="header-desktop">
    <div class="section__content section__content--p30">
        <div class="container-fluid">
            <div class="header-wrap">
                <!-- <form class="form-header" action="" method="POST">
                    <input class="au-input au-input--xl" type="text" name="search" placeholder="Search for datas &amp; reports..." style="visibility:hidden;" />
                    <button class="au-btn--submit" type="submit" style="visibility:hidden;">
                        <i class="zmdi zmdi-search" style="visibility:hidden;"></i>
                    </button>
                </form> -->
                <div></div>
                <div class="header-button">
                <div></div>
                    <div class="noti-wrap">
                        <!-- <div class="noti__item js-item-menu">
                            <i class="zmdi zmdi-comment-more"></i>
                            <span class="quantity">1</span>
                            <div class="mess-dropdown js-dropdown">
                                <div class="mess__title">
                                    <p>You have 2 news message</p>
                                </div>
                                <div class="mess__item">
                                    <div class="image img-cir img-40">
                                        <img src="<%= request.getContextPath() %>/resources/admin_bootstrap/images/icon/avatar-06.jpg" alt="Michelle Moreno" />
                                    </div>
                                    <div class="content">
                                        <h6>Michelle Moreno</h6>
                                        <p>Have sent a photo</p>
                                        <span class="time">3 min ago</span>
                                    </div>
                                </div>
                                <div class="mess__item">
                                    <div class="image img-cir img-40">
                                        <img src="<%= request.getContextPath() %>/resources/admin_bootstrap/images/icon/avatar-04.jpg" alt="Diane Myers" />
                                    </div>
                                    <div class="content">
                                        <h6>Diane Myers</h6>
                                        <p>You are now connected on message</p>
                                        <span class="time">Yesterday</span>
                                    </div>
                                </div>
                                <div class="mess__footer">
                                    <a href="#">View all messages</a>
                                </div>
                            </div>
                        </div>
                        <div class="noti__item js-item-menu">
                            <i class="zmdi zmdi-email"></i>
                            <span class="quantity">1</span>
                            <div class="email-dropdown js-dropdown">
                                <div class="email__title">
                                    <p>You have 3 New Emails</p>
                                </div>
                                <div class="email__item">
                                    <div class="image img-cir img-40">
                                        <img src="<%= request.getContextPath() %>/resources/admin_bootstrap/images/icon/avatar-06.jpg" alt="Cynthia Harvey" />
                                    </div>
                                    <div class="content">
                                        <p>Meeting about new dashboard...</p>
                                        <span>Cynthia Harvey, 3 min ago</span>
                                    </div>
                                </div>
                                <div class="email__item">
                                    <div class="image img-cir img-40">
                                        <img src="<%= request.getContextPath() %>/resources/admin_bootstrap/images/icon/avatar-05.jpg" alt="Cynthia Harvey" />
                                    </div>
                                    <div class="content">
                                        <p>Meeting about new dashboard...</p>
                                        <span>Cynthia Harvey, Yesterday</span>
                                    </div>
                                </div>
                                <div class="email__item">
                                    <div class="image img-cir img-40">
                                        <img src="<%= request.getContextPath() %>/resources/admin_bootstrap/images/icon/avatar-04.jpg" alt="Cynthia Harvey" />
                                    </div>
                                    <div class="content">
                                        <p>Meeting about new dashboard...</p>
                                        <span>Cynthia Harvey, April 12,,2018</span>
                                    </div>
                                </div>
                                <div class="email__footer">
                                    <a href="#">See all emails</a>
                                </div>
                            </div>
                        </div> -->
                        
                        <!-- <%for(int i=0;i<15;i++){%>&nbsp;<%}%><div class="noti__item js-item-menu">
                            <%for(int i=0;i<10;i++){%>&nbsp;<%}%><i class="zmdi zmdi-notifications"></i>
                            <span class="quantity">9&#43;(승인 대기중인 판매자 수(임시로 9개 이상일때를 가정하여 9+로 해놨음))</span>
                            <div class="notifi-dropdown js-dropdown">
                                <div class="notifi__title">
                                    <p>판매 승인 대기중인 판매자 수 : 2130(임시)</p>
                                </div> -->
                                <!-- <div class="notifi__item">
                                    <div class="bg-c1 img-cir img-40">
                                        <i class="zmdi zmdi-email-open"></i>
                                    </div>
                                    <div class="content">
                                        <p>You got a email notification</p>
                                        <span class="date">April 12, 2018 06:50</span>
                                    </div>
                                </div> -->
                                <!-- <div class="notifi__item">
                                    <div class="bg-c2 img-cir img-40">
                                        <i class="zmdi zmdi-account-box"></i>
                                    </div>
                                    <div class="content">
                                        <p>미 승인된 판매자 ID(notifi__item class의 div부터 for each로 승인 대기중인 판매자 수 만큼 나타내면 될듯)</p>
                                        <span class="date">가입 날짜</span>
                                    </div>
                                </div> -->
                                <!-- <div class="notifi__item">
                                    <div class="bg-c3 img-cir img-40">
                                        <i class="zmdi zmdi-file-text"></i>
                                    </div>
                                    <div class="content">
                                        <p>You got a new file</p>
                                        <span class="date">April 12, 2018 06:50</span>
                                    </div>
                                </div>
                                <div class="notifi__footer">
                                    <a href="#">All notifications</a>
                                </div> -->
                            <!-- </div>
                        </div> -->
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
                                    <div class="image">
                                        <a href="/rudisfarm/admin/admin-info">
                                            <img src="<%= request.getContextPath() %>/resources/images/images.jpg" alt="Admin" />
                                        </a>
                                    </div>
                                    <div class="content" style="margin-left: 0px;">
                                        <h5 class="name">
                                            <a href="/rudisfarm/admin/admin-info">${USER_NAME}</a>
                                        </h5>
                                        <span class="email">이메일 : ${EMAIL}</span>
                                    </div>
                                </div>
                                <div class="account-dropdown__body">
                                    <div class="account-dropdown__item">
                                        <a href="/rudisfarm/admin/admin-info">
                                            <i class="zmdi zmdi-account"></i>관리자 정보</a>
                                    </div>
                                    <!-- <div class="account-dropdown__item">
                                        <a href="#">
                                            <i class="zmdi zmdi-settings"></i>Setting</a>
                                    </div>
                                    <div class="account-dropdown__item">
                                        <a href="#">
                                            <i class="zmdi zmdi-money-box"></i>Billing</a>
                                    </div> -->
                                </div>
                                <div class="account-dropdown__footer">
                                    <a href="/rudisfarm/admin/admin-logout">
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