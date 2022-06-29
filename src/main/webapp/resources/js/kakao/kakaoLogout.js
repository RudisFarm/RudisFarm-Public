function logoutWithKakao() {
	Kakao.Auth.logout(function() {
//	  alert("카카오 로그아웃(토큰 만료) 성공");
//	  console.log("로그아웃 성공 후 토큰 조회 : "+Kakao.Auth.getAccessToken());
	  $('#logout').submit();
	});
}