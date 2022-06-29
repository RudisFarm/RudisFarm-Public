<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>get-product</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var kategorie = new Map();
		
		// 카테고리 값 가져오기
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/product-type',
			dataType : 'json',
			contentType : 'application/json; charset=utf-8;',
			//data : JSON.stringify(form),
			success : function(data) {
				console.log(data);
				$.each(data, function(index, key) {
					console.log(index);
					$("#TYPE1").append($("<option value="+index+">"+index+"</option>"));
					kategorie.set(index, key);
				});
			},
			error : function(data) {
				console.log("에러 발생!");
				console.log(data);
			}
		});
		
		// 버튼 누를경우 글 등록
		$("#postBtn").click(function() {
			var form = {
					name : $('input[name=NAME]').val(),
					price : $('input[name=PRICE]').val(),
					weight : $('input[name=WEIGHT]').val(),
					count : $('input[name=COUNT]').val(),
					description : $('textarea[name=DESCRIPTION]').val(),
					type1 : $('select[name=TYPE1]').val(),
					type2 : $('select[name=TYPE2]').val(),
					sumnail : $('input[name=SUMNAIL]').val(),
					files : $('input[name=FILES]').val()
				}
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/seller-user-manage',
				dataType : 'json',
				contentType : 'application/json; charset=utf-8;',
				data : JSON.stringify(form),
				success : function(data) {
					console.log("Response 수신 성공!");
					if (data) {
						alert("등록 성공");
						location.href='${pageContext.request.contextPath}/product';
					} else {
						alert("등록을 실패했습니다. 다시 시도해주세요.");
					}
				},
				error : function(data) {
					console.log("에러 발생!");
					console.log(data);
				}
			});
		});
		
		$("#TYPE1").change( function() {
			var value = $("#TYPE1 option:selected").val();
			$('#TYPE2').children('option:not(:first)').remove();
			
			for(var i in kategorie.get(value)) {
				let type2 = kategorie.get(value)[i]["type2"];
				$("#TYPE2").append($("<option value="+type2+">"
						+type2+"</option>"));
			}
		});
	})
</script>
</head>
<body>
	<label>NAME</label>
	<input type="text" name="NAME">
	<br>
	<label>PRICE</label>
	<input type="number" name="PRICE">
	<br>
	<label>WEIGHT</label>
	<input type="number" name="WEIGHT">
	<br>
	<label>COUNT</label>
	<input type="number" name="COUNT">
	<br>
	<label>DESCRIPTION</label>
	<br>
	<textarea name="DESCRIPTION" rows="5" cols="30">
	</textarea>
	<br>
	<label>TYPE1</label>
	<select name="TYPE1" id="TYPE1">
		<option value="notSelect">-----</option>
	</select>
	<br>

	<label>TYPE2</label>
	<select name="TYPE2" id="TYPE2">
		<option value="notSelect">-----</option>
	</select>
	<br>
	
	<label>SUMNAIL</label>
	<input type="text" name="SUMNAIL">
	<br>
	<label>FILES</label>
	<input type="text" name="FILES">
	<br>

	<button id="postBtn">전송하기</button>
</body>
</html>