
$(function() {
	
	var kategorie = new Map();
		
	// 카테고리 값 가져오기
	$.ajax({
		type : 'POST',
		url : '/rudisfarm/product-type',
		dataType : 'json',
		contentType : 'application/json; charset=utf-8;',
		async: false,
		success : function(data) {
			$.each(data, function(index, key) {
				$('#product-categories').append(
						'<li><a href="/rudisfarm/product?page=1&type1='+index+'">'+index+'</a>'+
								'<span class="count">'+key.length+
								'</span>'+
						'</li>'
				);
				kategorie.set(index, key);
			});
		},
		error : function(data) {
			console.log(data);
			console.log("에러 발생!");
		}
	});
})
			  
			  
			  
			  