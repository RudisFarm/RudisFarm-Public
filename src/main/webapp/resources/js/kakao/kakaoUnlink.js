function unlinkWithKakao() {
	console.log(Kakao.Auth.getAccessToken());
	
	if (Kakao.Auth.getAccessToken() != null) {
		$.ajax({
			type: 'PUT',
			url: '/rudisfarm/my-page/socialout', 
			dataType: 'json',
			success: function(data) {
				console.log(data);
				if(data.resultCode == 1) {
					console.log("스프링 회원탈퇴 처리 성공");
					Kakao.API.request({
					  url: '/v1/user/unlink',
					  success: function(response) {
//					    console.log(response);
//					    alert("카카오 연동해제 성공");
//					    console.log("연동해제 성공 후 토큰 조회 : "+Kakao.Auth.getAccessToken());
						Kakao.Auth.logout(function() {
//						  alert("카카오 로그아웃(토큰 만료) 성공");
//						  console.log("로그아웃 성공 후 토큰 조회 : "+Kakao.Auth.getAccessToken());
						  $('#logout').submit();
						});
//					    location.href='/rudisfarm/logout'
					  },
					  fail: function(error) {
					    console.log(error);
					  },
					});
				} else {
					console.log("스프링 회원탈퇴 처리 실패");
					Kakao.API.request({
					  url: '/v1/user/unlink',
					  success: function(response) {
//					    console.log(response);
//					    alert("카카오 연동해제 성공");
//					    console.log("연동해제 성공 후 토큰 조회 : "+Kakao.Auth.getAccessToken());
					  },
					  fail: function(error) {
					    console.log(error);
					  },
					});
				}
				
				
			},
			error: function(e) {
				console.log("에러 발생!");
				console.log(e);
			}
		});
	} else {
		console.log('로그아웃 되어 있음.');
	}
}