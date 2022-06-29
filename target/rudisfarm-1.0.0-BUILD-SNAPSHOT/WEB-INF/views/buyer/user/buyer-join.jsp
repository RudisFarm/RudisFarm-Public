<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(e){
		
		var idx = false;
		
		$('#signUp').click(function(){
			if($.trim($('#userid').val()) == ''){
				alert("아이디 입력.");
				$('#userid').focus();
				return;
			}else if($.trim($('#InputPassword1').val()) == ''){
				alert("패스워드를 입력해주세요.");
				$('#InputPassword1').focus();
				return;
			}
			//패스워드 확인
			else if($('#InputPassword1').val() != $('#InputPassword2').val()){
				alert('패스워드가 다릅니다.');
				$('#InputPassword2').focus();
				return;
			} else if($.trim($('#InputEmail').val()) == ''){
				alert("이메일을 입력해주세요.");
				$('#InputEmail').focus();
				return;
				
			}else if($.trim($('#FIR_ADDRESS').val()) == ''){
				alert("주소를 입력해주세요.");
				$('#FIR_ADDRESS').focus();
				return;
			
			}else if($.trim($('#SEC_ADDRESS').val()) == ''){
				alert("상세 주소를 입력해주세요.");
				$('#SEC_ADDRESS').focus();
				return;
				
			}else if($.trim($('#InputTel').val()) == ''){
				alert("전화번호를 입력해주세요.");
				$('#InputTel').focus();
				return;
				
			}else if($.trim($('#InputBirth').val()) == ''){
				alert("생일을 입력해주세요.");
				$('#InputBirth').focus();
				return;
			}
			
			if(idx==false){
				alert("아이디 중복체크를 해주세요.");
				return;
			}else{
				$('#joinForm').submit();
			}
		});
		
		$('#idCheck').click(function(){
			$.ajax({
				url: "${pageContext.request.contextPath}/idCheck",
				type: "GET",
				data:{
					"idcheckval":$('#userid').val()
				},
				success: function(data){
					if(data == 0 && $.trim($('#userid').val()) != '' ){
						idx=true;
						$('#userid').attr("readonly",true);
						var html="<tr><td colspan='3' style='color: green'>사용 가능한 아이디입니다.</td></tr>";
						$('#idCheck').empty();
						$('#idCheck').append(html);
					}else{
						var html="<tr><td colspan='3' style='color: red'>이미 있는 아이디입니다! 변경 후 다시 클릭해주세요.</td></tr>";
						$('#idCheck').empty();
						$('#idCheck').append(html);
					}
				},
				error: function(){
					alert("서버에러");
				}
			});
			
		});
		
	    
	        
	    });
</script>
<script>
$(document).ready(function(e){
$('#mail_check_button').click(function(){
    
    var email = $('#InputEmail').val(); // 이메일 가져오기
    console.log('메일 펑션');
    
         $.ajax({
        url:"mailCheck?email=" + email,
        type:"GET",
    }); 
    
});
});
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//https://postcode.map.daum.net/guide#sample 참조
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6 p-3">
				<form name="userJoinForm" action="join" method="post" id="joinForm">
					<fieldset>
						<legend class="text-center">회원가입</legend>
						<div class="form-group">
							<label for="inputID">아이디</label>
							<div class="row">
								<div class="col-md-7">
									<input type="text" class="form-control" id="userid" name="USER_ID" onkeydown="isIdChanged();" maxlength="20" autofocus required>
								</div>
								<div id="checkMsg"></div>
								<div class="col-md-5">
									<button type="button" class="btn btn-primary m-0" id="idCheck" onclick="validation();">중복체크</button>
									<input type="hidden" name="idDupliaction" value="idUncheck">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="InputPassword1">비밀번호</label> 
							<input type="password" class="form-control" id="InputPassword1" name="PASSWORD" maxlength="30" required>
						</div>
						<div class="form-group">
							<label for="InputPassword2">비밀번호 확인</label> 
							<input type="password" class="form-control" id="InputPassword2" name="PASSWORD_CHECK" maxlength="30" required>
						</div>
						<div> 
							<label for="InputEmail">이메일</label>
							<div> 
								<input type="email" class="mail_input" id="InputEmail"> 
							</div> 
							<div> 
								<div id="mail_check_input_box_false" name="EMAIL"> 
									<input type="text" id="mail_check_input">
									<input type="button" id="mail_check_button" value="인증번호 발송">
								</div> 
							</div> 
						</div>
						<div class="form-group">
							<label for="InputName">이름</label> 
							<input type="text" class="form-control" id="InputName" name="NAME" maxlength="10" required>
						</div>
						<div >
							<input type="text" id="postcode" placeholder="우편번호" disabled required>
							<input type="button" onclick="execDaumPostcode()" value="주소 검색"><br>
							<input type="text" id="address" name="FIR_ADDRESS" placeholder="주소" readonly required><br>
							<input type="text" id="detailAddress" name="SEC_ADDRESS" placeholder="상세주소" required>
							<input type="hidden" id="extraAddress" placeholder="참고항목" disabled>
						</div>
						<div class="form-group">
							<label for="InputTel">휴대전화 번호</label> 
							<input type="text" class="form-control" id="InputTel" name="PHONE" maxlength="11" required>
						</div>
						<div class="form-group">
							<label for="InputBirth">생년월일</label> 
							<input type="date" class="form-control" id="InputBirth" name="BIRTHDATE" required>
						</div>
						<div>
							<input type="radio" name="chk_gender" value="1" checked="checked">남자
							<input type="radio" name="chk_gender" value="2" >여자
						</div>
						<div class="text-center">
							<button type="button" id="signUp" class="btn btn-primary">회원가입</button>
							<button type="button" class="btn btn-secondary" onclick="javascipt:location.href='./';">메인으로</button>
						</div>
					</fieldset>
				</form>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
</body>
</html>