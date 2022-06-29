$(function() {
	$.ajax({
		type : 'POST',
		url : '/rudisfarm/product-type',
		dataType : 'json',
		contentType : 'application/json; charset=utf-8;',
		success : function(data) {
			$.each(data, function(index, key) {
				for(var i in key) {
					let type2 = key[i]["type2"];
					if(type2 === "그외") {
						continue;
					}
						$('#tagcloud').append(
								'<a href="/rudisfarm/product?page=1&type2='+type2+'">'+type2+'</a>'
						);
					
				}
			});
		},
		error : function(data) {
			console.log(data);
			console.log("에러 발생!");
		}
	});
})
