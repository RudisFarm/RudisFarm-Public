function signOut() {
	var auth2 = gapi.auth2.getAuthInstance();
	auth2.signOut().then(function () {
//		alert("구글 로그아웃(토큰 만료) 성공");
		$('#logout').submit()
//		console.log('User signed out.');
	});
}

function getGoogleAuth2() {
	return gapi.auth2.getAuthInstance();
}

function logoutWithGoogle() {
	signOut();
	document.getElementById('logout').submit();
}