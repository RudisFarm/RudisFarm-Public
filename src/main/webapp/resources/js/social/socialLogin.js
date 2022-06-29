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
			if(data.resultCode == 1) {
				if(data.prevPage != null) {
					location.href=data.prevPage;
				} else {
					location.href='/rudisfarm';
				}
			} else if(data.resultCode == -1) {
				console.log("이미 해당 이메일로 루디스팜 계정 가입됨");
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