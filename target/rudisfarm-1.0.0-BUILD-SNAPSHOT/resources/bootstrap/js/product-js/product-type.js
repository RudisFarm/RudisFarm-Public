$(function() {
		var kategorie = new Map();
		
		// 카테고리 값 가져오기
		$.ajax({
			type : 'POST',
			url : '/rudisfarm/product-type',
			dataType : 'json',
			contentType : 'application/json; charset=utf-8;',
			//data : JSON.stringify(form),
			success : function(data) {
				console.log(data);
				$.each(data, function(index, key) {
					console.log(index);
					$("#TYPE1").append("<option value="+index+">"+index+"</option>");
					kategorie.set(index, key);
				});
			},
			error : function(data) {
				console.log("에러 발생!");
				console.log(data);
			}
		});
		
		$("#TYPE1").change( function() {
			var value = $("#TYPE1 option:selected").val();
			$('#TYPE2').children('option:not(:first)').remove();
			$('input[name=TYPE2]').val("");
			
			for(var i in kategorie.get(value)) {
				let type2 = kategorie.get(value)[i]["type2"];
				$("#TYPE2").append("<option value="+type2+">"
						+type2+"</option>");
			}
			$('input[name=TYPE1]').val($('#TYPE1 option:selected').val());
		});
		
		$("#TYPE2").change( function() {
			$('input[name=TYPE2]').val($('#TYPE2 option:selected').val());
		});
	})
