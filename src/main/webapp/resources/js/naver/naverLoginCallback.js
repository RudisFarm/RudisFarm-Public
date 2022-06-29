var naverLogin = new naver.LoginWithNaverId({
	   clientId: "NaNxx_xmbpxuMhkRKTRo",
       callbackUrl: "http://www.rudisfarm.shop/rudisfarm/naverlogin",
       isPopup: false,
       callbackHandle: true
    });
 naverLogin.init();
 
 

 window.addEventListener('load', function () {
    naverLogin.getLoginStatus(function (status) {

       if (status) {
          var email = naverLogin.user.getEmail();
          if( email == undefined || email == null || naverLogin.user.gender == undefined || naverLogin.user.gender == null) {
             alert("이메일, 성별은 필수정보입니다. 정보제공을 동의해주세요.");
             naverLogin.reprompt();
             return;
          } else {
        	  var url;
        	  
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
							} else {
								console.log("취소");
								opener.naverLoginResult(data);
								self.close();
							}
						} else if(data.resultCode == -1) {
							console.log("해당 이메일로 가입된 루디스팜 계정이 이미 존재합니다.");
							opener.naverLoginResult(data);
							self.close();
						} else {
							console.log("스프링 로그인 처리 실패");
						}
					},
					error: function(e) {
						console.log("에러 발생!");
						console.log(e);
					}
				});
          }
       } else {
          console.log("callback 처리에 실패하였습니다.");
       }
       
       
 	   
    });
 });