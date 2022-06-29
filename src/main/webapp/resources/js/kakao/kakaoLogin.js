function loginWithKakao() {
    Kakao.Auth.login({
      success: function(response) {
        console.log(response);
        
        Kakao.API.request({
            url: '/v2/user/me',
            success: function(response) {
                console.log(response);
                console.log(response.kakao_account.email);
                console.log(response.kakao_account.gender);
                console.log(response.kakao_account.profile.nickname);
                
                if(response.kakao_account.email == undefined || response.kakao_account.gender == undefined || response.kakao_account.profile.nickname == undefined) {
                	alert("이메일, 성별은 필수정보입니다. 정보제공을 동의해주세요.");
                	unlinkWithKakao();
                	return;
                }
                
                $.ajax({
					type: 'POST',
					url: '/rudisfarm/socialcheck', 
					dataType: 'json',
					contentType: "application/json; charset=utf-8;",
					data: JSON.stringify({
						USER_ID: response.id,
						EMAIL: response.kakao_account.email,
						GENDER: response.kakao_account.gender,
						USER_NAME: response.kakao_account.profile.nickname,
						PLATFORM: "kakao"
					}), 
					success: function(data) {
//						console.log(data);
						if(data.resultCode == 1) {
							console.log("즉시 회원가입+로그인 진행이 가능합니다.");
							socialJoinAndLogin(response.id, response.kakao_account.email, response.kakao_account.gender, response.kakao_account.profile.nickname, "kakao");
						} else if(data.resultCode == 2) {
//							console.log("탈퇴된 상태입니다. 재가입 동의가 필요합니다.");
							if(confirm("탈퇴된 소셜 계정입니다. 다시 가입하시겠습니까?")) {
								console.log("재가입");
								socialJoinAndLogin(response.id, response.kakao_account.email, response.kakao_account.gender, response.kakao_account.profile.nickname, "kakao");
							} else {
//								console.log("취소");
								unlinkWithKakao();
								//logoutWithKakao();
//								console.log("소셜 로그아웃(토큰 만료) 시도")
							}
						} else if(data.resultCode == -1) {
							alert("이미 가입되어 있는 이메일입니다.");
							unlinkWithKakao();
//							logoutWithKakao();
//							console.log("소셜 로그아웃(토큰 만료) 시도")
						} else {
							console.log("스프링 로그인 처리 실패");
						}
					},
					error: function(e) {
						console.log("에러 발생!");
						console.log(e);
					}
				});
                
            },
            fail: function(error) {
                console.log(error);
            }
        });
      },
      fail: function(err) {
    	console.log(err);
      }
    });
}