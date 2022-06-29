<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>naver-login</title>
<!-- <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script> -->
<%-- <script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/naver/naveridlogin_js_sdk_2.0.2.js"></script> --%>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId({
		   clientId: "NaNxx_xmbpxuMhkRKTRo",
	       callbackUrl: "http://localhost:8088/rudisfarm/naverlogin",
           isPopup: false,
           callbackHandle: true
        });
     naverLogin.init();
     
     

     window.addEventListener('load', function () {
        naverLogin.getLoginStatus(function (status) {

           if (status) {
              var email = naverLogin.user.getEmail();
              if( email == undefined || email == null) {
                 alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
                 naverLogin.reprompt();
                 return;
              } else {
//             	  console.log(naverLogin);
            	  var url;
            	  
            	  //
            	  $.ajax({
						type: 'POST',
						url: '/rudisfarm/socialcheck', 
						dataType: 'json',
						contentType: "application/json; charset=utf-8;",
						data: JSON.stringify({
							USER_ID: naverLogin.user.id,
							EMAIL: naverLogin.user.email,
							GENDER: naverLogin.user.gender,
							USER_NAME: naverLogin.user.name,
							PLATFORM: "naver"
						}), 
						success: function(data) {
							console.log(data);
							if(data.resultCode == 1) {
								console.log("즉시 회원가입+로그인 진행이 가능합니다.");
								socialJoinAndLogin(naverLogin.user.id, naverLogin.user.email, naverLogin.user.gender, naverLogin.user.name, "naver");
							} else if(data.resultCode == 2) {
								console.log("탈퇴된 상태입니다. 재가입 동의가 필요합니다.");
								if(confirm("탈퇴된 소셜 계정입니다. 다시 가입하시겠습니까?")) {
									console.log("재가입");
									socialJoinAndLogin(naverLogin.user.id, naverLogin.user.email, naverLogin.user.gender, naverLogin.user.name, "naver");
								} else if(data.resultCode == -1) {
									console.log("해당 이메일로 가입된 루디스팜 계정이 이미 존재합니다.");
									opener.naverLoginResult(data);
									self.close();
								} else {
									console.log("취소");
									opener.naverLoginResult(data);
									self.close();
								}
							} else {
								console.log("스프링 로그인 처리 실패");
							}
						},
						error: function(e) {
							console.log("에러 발생!");
							console.log(e);
						}
					});
            	  //
            	  
//             	  $.ajax({
// 						type: 'POST',
// 						url: '/rudisfarm/naverlogin', 
// 						dataType: 'json',
// 						contentType: "application/json; charset=utf-8;",
// 						data: JSON.stringify({
// 							USER_ID: naverLogin.user.id,
// 							EMAIL: naverLogin.user.email,
// 							GENDER: naverLogin.user.gender,
// 							USER_NAME: naverLogin.user.name,
// 							PLATFORM: "naver"
// 						}), 
// 						success: function(data) {
// 							console.log(data);
// 							if(data.resultCode == 1) {
// 								if(data.prevPage != null) {
// // 									location.href=data.prevPage;
// 									url = data.prevPage;
// 								} else {
// // 									location.href='/rudisfarm';
// 									url = '/rudisfarm';
// 								}
// 							} else if(data.resultCode == -1) {
// 								console.log("이미 해당 이메일로 루디스팜 계정 가입됨");
// 								url = '/login';
// 							} else {
// 								console.log("스프링 로그인 처리 실패");
// 							}
// 							opener.naverLoginResult(data, naverLogin);
// 							self.close();
// 						},
// 						error: function(e) {
// 							alert("로그인 시도중 오류가 발생했습니다. 관리자에게 문의해주세요.")
// 							console.log("에러 발생!");
// 							console.log(e);
// 						}
// 					});
              }
           } else {
              console.log("callback 처리에 실패하였습니다.");
           }
           
           
     	   
        });
     });
     
     function socialJoinAndLogin(id, email, gender, user_name, platform) {
 		$.ajax({
 			type: 'POST',
 			url: '/rudisfarm/socialjoinandlogin', 
 			dataType: 'json',
 			contentType: "application/json; charset=utf-8;",
 			data: JSON.stringify({
 				USER_ID: id,
 				EMAIL: email,
 				GENDER: gender,
 				USER_NAME: user_name,
 				PLATFORM: platform
 			}), 
 			success: function(data) {
 				console.log(data);
 				 var url;
 				if(data.resultCode == 1) {
 					if(data.prevPage != null) {
 						url=data.prevPage;
 					} else {
 						url='/rudisfarm';
 					}
 				} else if(data.resultCode == -1) {
 					console.log("이미 해당 이메일로 루디스팜 계정 가입됨");
 					url='/logi';
 				} else {
 					console.log("스프링 로그인 처리 실패");
 				}
 				opener.naverLoginResult(data);
				self.close();
 			},
 			error: function(e) {
 				console.log("에러 발생!");
 				console.log(e);
 			}
 		});
 	}
     //
     //
// 	var naver_id_login = new naver_id_login("NaNxx_xmbpxuMhkRKTRo", "http://localhost:8088/rudisfarm/naverlogin");
	
// 	//접근 토큰 값 출력
// 	alert('네이버 접근토큰값:'+naver_id_login.oauthParams.access_token);
	
// 	// 네이버 사용자 프로필 조회
// 	if(naver_id_login.oauthParams.access_token != null) {
// // 		naver_id_login.get_naver_userprofile("opener.naverSignInCallback(naver_id_login)");
// 		naver_id_login.get_naver_userprofile("naverSignInCallback()");
// 		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		
// 		function naverSignInCallback() {
// 			alert(naver_id_login.getProfileData('id'));
// 			alert(naver_id_login.getProfileData('email'));
// 			alert(naver_id_login.getProfileData('name'));
// 			alert(naver_id_login.getProfileData('birthday'));
// 			alert(naver_id_login.getProfileData('birthyear'));
// 			alert(naver_id_login.getProfileData('gender'));
// 			alert(naver_id_login.getProfileData('mobile'));
// 		}
// // 		self.close();
// 	}
</script>
</head>
</html>