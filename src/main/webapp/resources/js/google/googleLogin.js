//function loginWithGoogle() {
//	console.log(gapi.auth2.getAuthInstance().auth2.isSignedIn.get());
//	if(gapi.auth2.getAuthInstance().auth2.isSignedIn.get()) {
//		console.log("수행");
//	}
//}

//function onSignIn(googleUser) {
//	var profile = googleUser.getBasicProfile();
//	console.log('User signed in.');
//	
//	//자동수행 방지가 가능한가?? 이어서 진행
//	
//	$.ajax({
//		type: 'POST',
//		url: '/rudisfarm/socialcheck', 
//		dataType: 'json',
//		contentType: "application/json; charset=utf-8;",
//		data: JSON.stringify({
//			USER_ID: profile.getId(),
//			EMAIL: profile.getEmail(),
//			GENDER: "",
//			USER_NAME: profile.getName(),
//			PLATFORM: "google"
//		}), 
//		success: function(data) {
//			console.log(data);
//			if(data.resultCode == 1) {
//				console.log("즉시 회원가입+로그인 진행이 가능합니다.");
//				socialJoinAndLogin(profile.getId(), profile.getEmail(), "", profile.getName(), "google");
//			} else if(data.resultCode == 2) {
//				console.log("탈퇴된 상태입니다. 재가입 동의가 필요합니다.");
//				if(confirm("탈퇴된 소셜 계정입니다. 다시 가입하시겠습니까?")) {
//					console.log("재가입");
//					socialJoinAndLogin(profile.getId(), profile.getEmail(), "", profile.getName(), "google");
//				} else {
//					console.log("취소");
//					gapi.auth2.getAuthInstance().disconnect();
//					gapi.auth2.getAuthInstance().signOut();
//					console.log("소셜 로그아웃(토큰 만료) 시도")
//				}
//			} else if(data.resultCode == -1) {
//				console.log("해당 이메일로 가입된 루디스팜 계정이 이미 존재합니다.");
//				logoutWithGoogle();
//				console.log("소셜 로그아웃(토큰 만료) 시도")
//			} else {
//				console.log("스프링 로그인 처리 실패");
//			}
//		},
//		error: function(e) {
//			console.log("에러 발생!");
//			console.log(e);
//		}
//	});
//}
var auth2;
var googleUser;
var startApp = function() {
	gapi.load('auth2', function() {
		auth2 = gapi.auth2.init({
			client_id: '841330796396-5lf04j9tabk2nk5k94g21hgfjcomolm8.apps.googleusercontent.com',
			cookiepolicy: 'single_host_origin',
			scope: 'profile email'
		});
		
		if(document.getElementById('customBtn') != null) {
			attachSignin(document.getElementById('customBtn'));
		}
	});
};

function attachSignin(element) {
	console.log(element.id);
	auth2.attachClickHandler(element, {},
			function(googleUser) {
				var profile = googleUser.getBasicProfile();
				
				$.ajax({
					type: 'POST',
					url: '/rudisfarm/socialcheck', 
					dataType: 'json',
					contentType: "application/json; charset=utf-8;",
					data: JSON.stringify({
						USER_ID: profile.getId(),
						EMAIL: profile.getEmail(),
						GENDER: "",
						USER_NAME: profile.getName(),
						PLATFORM: "google"
					}), 
					success: function(data) {
//						console.log(data);
						if(data.resultCode == 1) {
							console.log("즉시 회원가입+로그인 진행이 가능합니다.");
							socialJoinAndLogin(profile.getId(), profile.getEmail(), "", profile.getName(), "google");
						} else if(data.resultCode == 2) {
							console.log("탈퇴된 상태입니다. 재가입 동의가 필요합니다.");
							if(confirm("탈퇴된 소셜 계정입니다. 다시 가입하시겠습니까?")) {
								console.log("재가입");
								socialJoinAndLogin(profile.getId(), profile.getEmail(), "", profile.getName(), "google");
							} else {
//								console.log("취소");
								gapi.auth2.getAuthInstance().disconnect();
								gapi.auth2.getAuthInstance().signOut();
//								console.log("소셜 로그아웃(토큰 만료) 시도")
							}
						} else if(data.resultCode == -1) {
							alert("이미 가입되어 있는 이메일입니다.");
							gapi.auth2.getAuthInstance().disconnect();
							gapi.auth2.getAuthInstance().signOut();
//							logoutWithGoogle();
//							console.log("소셜 로그아웃(토큰 만료) 시도")
						} else {
//							console.log("스프링 로그인 처리 실패");
						}
					},
					error: function(e) {
						console.log("에러 발생!");
						console.log(e);
					}
				});
				
			}, function(error) {
//				alert(JSON.stringify(error, undefined, 2));
			});
}

//window.onload = function() {
//	startApp();
//}

//	$.ajax({
//		type: 'POST',
//		url: '/rudisfarm/kakaologin', 
//		dataType: 'json',
//		contentType: "application/json; charset=utf-8;",
//		data: JSON.stringify({
//			USER_ID: profile.getId(),
//			EMAIL: profile.getEmail(),
//			GENDER: "",
//			USER_NAME: profile.getName(),
//			PLATFORM: "google"
//		}), 
//		success: function(data) {
//			console.log(data);
//			if(data.resultCode == 1) {
//				if(data.prevPage != null) {
//					location.href=data.prevPage;
//				} else {
//					location.href='/rudisfarm';
//				}
//			} else if(data.resultCode == -1) {
//				console.log("이미 해당 이메일로 루디스팜 계정 가입됨");
//			} else {
//				console.log("스프링 로그인 처리 실패");
//			}
//		},
//		error: function(e) {
//			console.log("에러 발생!");
//			console.log(e);
//		}
//	});
