//head가 아닌 소스 최하단 스크립트에 위치시켜야 작동
//onload로 로딩 후 사용하게 수정
function loginWithNaver() {
	if(document.getElementById('naverIdLogin') != null) {
		var naverLogin = new naver.LoginWithNaverId({
		      clientId: "NaNxx_xmbpxuMhkRKTRo",
		      callbackUrl: "http://www.rudisfarm.shop/rudisfarm/naverlogin",
		      isPopup: true,
		      loginButton: {color: "green", type: 3, height: 60}
		   });
		naverLogin.init();
	}
}

function handleNaverLogin() {
	if(document.getElementById('naverIdLogin') != null) {
		const loginBtn = document.getElementById('naverIdLogin').firstChild;
		loginBtn.click();
	}
}

function naverLoginResult(data) {
	if(data.resultCode == 1) {
		if(data.prevPage != null) {
				location.href=data.prevPage;
		} else {
				location.href='/rudisfarm';
		}
	} else if(data.resultCode == -1) {
//		console.log("이미 해당 이메일로 루디스팜 계정 가입됨");
		alert("이미 가입되어 있는 이메일입니다.");
	} else {
//		console.log("스프링 로그인 처리 실패");
	}
}