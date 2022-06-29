
	$(function() {
    	/*
    	요약:
    		put, delele를 ajax로 수행할 수 있다.
    		단, 파일을 다루기 위해 json 대신 formData 형식으로 넘기면 put을 사용할 수 없게 된다. 이 경우에는 어쩔 수 없이 post 방식으로 사용해야 한다.
    		formData 자체가 put을 지원하지 않는다.
    	*/
    	
    	// 판매자 회원가입
    	$("#sellerJoin").click(function(event) {
    		event.preventDefault();
    		var formData = new FormData($('#joinForm')[0]);
    		//formData.append('id', '아이디');
    		
    		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    		var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
    		var getId = RegExp(/^[a-zA-Z0-9]{4,20}$/);
    		var getPassword = RegExp(/^[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,50}$/);
    		var getName = RegExp(/^[가-힣]+$/);
    		var getPhone = RegExp(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/);
    		var getSerial = RegExp(/^[0-9]{3}-[0-9]{2}-[0-9]{5}$/);
    		var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
    		var maxSize = 5 * 1024 * 1024;
    		
    		var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정
    		
    		//아이디 공백 확인
    		if ($("#USER_ID").val() == "") { 
    			alert("아이디 입력바람");
    			$("#USER_ID").focus();
    			return false;
			}
    		
    		//아이디 유효성검사
    		if(!getId.test($("#USER_ID").val())){
    			alert("아이디는 영문 및 숫자로 4~20자리 형식에 맞게 입력해주세요");
    			$("#USER_ID").val("");
    			$("#USER_ID").focus();
    			return false;
			}
    		
    		//비밀번호 공백 확인
    		if($("#PASSWORD").val() == "") {
    			alert("비밀번호를 입력해주세요.");
    			$("#PASSWORD").focus();
    			return false;
			}

    		//아이디 비밀번호 같음 확인
    		if($("#USER_ID").val() == $("#PASSWORD").val()) {
    			alert("아이디와 비밀번호가 같습니다");
    			$("#PASSWORD").val("");
    			$("#PASSWORD").focus();
    			return false;
    		}
    		
    		//비밀번호 유효성검사
    		if(!getPassword.test($("#PASSWORD").val())) {
    			alert("비밀번호는 8~20자리의 영문, 숫자 및 특수문자 조합으로 입력해주세요.");
    			$("#PASSWORD").val("");
    			$("#PASSWORD").focus();
    			return false;
    		}
    		
    		//비밀번호 확인 공백 확인
    		if($("#PASSWORD_CONFIRM").val() == "") {
    			alert("비밀번호 확인란을 입력해주세요.");
    			$("#PASSWORD_CONFIRM").focus();
    			return false;
			}
    		
    		//비밀번호 서로확인
    		if($("#PASSWORD").val() != $("#PASSWORD_CONFIRM").val()) {
    			alert("비밀번호가 상이합니다.");
    			$("#PASSWORD").val("");
    			$("#PASSWORD_CONFIRM").val("");
    			$("#PASSWORD").focus();
    			return false;
    		}
    		
    		//이메일 공백 확인
    		if($("#EMAIL_CHECK").val() == "") {
    			alert("이메일을 입력해주세요");
    			$("#EMAIL_CHECK").focus();
    			return false;
    		}

    		//이메일 유효성 검사
    		if(!getMail.test($("#EMAIL_CHECK").val())) {
    			alert("이메일 형식에 맞게 입력해주세요.")
    			$("#EMAIL_CHECK").val("");
    			$("#EMAIL_CHECK").focus();
    			return false;
    		}

    		//이메일 인증 여부 검사
    		if($('#EMAIL_CHECK').val() == '' || $('#EMAIL').val() != $('#EMAIL_CHECK').val()) {
    			alert("이메일이 인증되지 않았습니다. 인증 후 시도해주세요.");
    			return false;
    		}
    		
    		//이름 공백 검사
    		if($("#NAME").val() == "") {
    			alert("업체명을 입력해주세요.");
    			$("#NAME").focus();
    			return false;
    		}
    		
    		//주소 공백 검사
    		if($("#FIR_ADDRESS").val() == "") {
    			alert("주소를 입력해주세요.");
    			$("#FIR_ADDRESS").focus();
    			return false;
    		}
    		
    		//상세주소 공백 검사
    		if($("#SEC_ADDRESS").val() == "") {
    			alert("상세주소를 입력해주세요.");
    			$("#SEC_ADDRESS").focus();
    			return false;
    		}

    		//전화번호 유효성 검사
    		if(!getPhone.test($("#PHONE").val())) {
    			alert("전화번호 형식에 맞게 입력해주세요.")
    			$("#PHONE").val("");
    			$("#PHONE").focus();
    			return false;
    		}
    		
    		//사업자등록번호 유효성 검사
    		if(!getSerial.test($("#SERIAL").val())) {
    			alert("사업자등록번호 형식에 맞게 입력해주세요.")
    			$("#SERIAL").val("");
    			$("#SERIAL").focus();
    			return false;
    		}
    		
    		//사업자등록번호 증빙자료 공백 검사
    		if($("#serial-image").val() == "") {
    			alert("사업자등록번호 증빙자료를 첨부해주세요.");
    			$("#serial-image").focus();
    			return false;
    		}
    		
    		//사업자등록번호 증빙자료 유효성 검사
    		if($("#serial-image").val() != "" && $("#serial-image").val() != null) {
    			var fileSize = document.getElementById("serial-image").files[0].size;
			    var imgFile = $("#serial-image").val();
    			
    			if(!imgFile.match(fileForm)) {
			    	alert("이미지 파일만 업로드 가능");
			        return false;
			    } else if(fileSize > maxSize) {
			    	alert("파일 사이즈는 5MB까지 가능");
			        return false;
			    }
    		}
    		
    		alert("유효성 검사 통과!");
    		
    		$.ajax({
				type: 'post',
				url: 'seller-join',
				enctype: 'multipart/form-data',
				processData: false,
				contentType: false,
				cache: false,
				data: formData, 
				success: function(data) {
					if(data) {
						alert("회원 신청처리 되었습니다.\n빠른 시일안에 처리 여부를 보내드리겠습니다.");
						location.href = "/rudisfarm";
					} else {
						alert("관리자에게 문의해 주시기 바랍니다.");
					}
				},
				error: function(e) {
					console.log("에러 발생!");
					console.log(e);
				}
			});
    	});
    	
    	// POST 메소드로 formData로 파일 전송
		$("#btnTest").click(function() {
    		var formData = new FormData($('#fileForm')[0]);
    		//formData.append('id', '아이디');
    		
    		$.ajax({
				type: 'post',
				url: 'test/putfile',
				enctype: 'multipart/form-data',
				processData: false,
				contentType: false,
				cache: false,
				data: formData, 
				success: function(data) {
					console.log("post으로 파일 전송 후 응답 수신 성공!");
					console.log(data);
					alert(data);
				},
				error: function(e) {
					console.log("에러 발생!");
					console.log(e);
				}
			});
    	});
		
    	// PUT 메소드로 JSON 데이터 전송
		$("#btnTest2").click(function() {
			$.ajax({
				type: 'put',
				url: 'test/a', 
				dataType: 'json',
				contentType: "application/json; charset=utf-8;",
				data: JSON.stringify({
							data: "아이디"
						}), 
				success: function(data) {
					console.log("PUT 수행 후 Response 수신 성공!");
					console.log(data);
					alert(data);
				},
				error: function(e) {
					console.log("에러 발생!");
					console.log(e);
				}
			});
		});
		
		// DELETE 메소드로 JSON 데이터 전송
		$("#btnTest3").click(function() {
			$.ajax({
				type: 'delete',
				url: 'test/a', 
				dataType: 'json',
				contentType: "application/json; charset=utf-8;",
				data: JSON.stringify({
							data: "아이디"
						}), 
				success: function(data) {
					console.log("DELETE 수행 후 Response 수신 성공!");
					console.log(data);
					alert(data);
				},
				error: function(e) {
					console.log("에러 발생!");
					console.log(e);
				}
			});
		});
		
		// PUT으로 formData 전송. 작동하지 않음!
		$("#btnTest4").click(function() {
    		var formData = new FormData($('#formVO')[0]);
    		//formData.append('id', '아이디');
    		
    		$.ajax({
				type: 'put',
				// put으로는 formdata를 인식하지 못한다. 파일이 없는 경우에 form값을 put으로 넘기고 싶다면 formData 대신 json에 담아서 넘겨야 한다.
				// https://okky.kr/article/625066 참고
				url: 'test/putform',
				headers:{
					"X-HTTP-Method-Override": "PUT"},
				enctype: 'multipart/form-data',
				processData: false,
				contentType: false,
				cache: false,
				data: formData, 
				success: function(data) {
					console.log("put으로 폼 전송 후 응답 수신 성공!");
					console.log(data);
					alert(data);
				},
				error: function(e) {
					console.log("에러 발생!");
					console.log(e);
				}
			});
    	});
		
    });

//        	<br>
//			<br>
//			<br>
//			<form id="fileForm" method="post" enctype="multipart/form-data">
//				<input class="au-input au-input--full" type="text" name="USER_ID" placeholder="아이디">
//				<input type="file" name="upload_file" id="upload_file" multiple />
//			</form>
//			
//			<form id="formVO" method="post" enctype="multipart/form-data">
//				<input type="hidden" name="_method" value="put">
//				<input class="au-input au-input--full" type="text" name="USER_ID" placeholder="아이디">
//			</form>
//			<button id="btnTest">버튼post파일</button>
//			<button id="btnTest2">버튼put</button>
//			<button id="btnTest3">버튼delete</button>
//			<button id="btnTest4">버튼put폼</button>
			