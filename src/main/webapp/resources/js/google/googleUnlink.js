function unlinkGoogle() {
	var auth2 = gapi.auth2.getAuthInstance();

	if(auth2.isSignedIn.get()) {
		$.ajax({
			type: 'PUT',
			url: '/rudisfarm/my-page/socialout', 
			dataType: 'json',
			success: function(data) {
				console.log(data);
				if(data.resultCode == 1) {
//					console.log("스프링 회원탈퇴 처리 성공");
					auth2.disconnect();
					auth2.signOut();
//					alert("구글 연동 해제 완료");
//					console.log("로그인 여부 : "+gapi.auth2.getAuthInstance().isSignedIn.get());
				} else {
//					console.log("스프링 회원탈퇴 처리 실패");
				}
			},
			error: function(e) {
				console.log("에러 발생!");
				console.log(e);
			}
		});
	} else {
//		console.log('로그아웃 되어 있음.');
	}
	
	
	
	
}