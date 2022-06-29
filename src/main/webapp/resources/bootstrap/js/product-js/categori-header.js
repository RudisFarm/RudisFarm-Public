$(function() {
		$.ajax({
			type : 'POST',         
			url: '/rudisfarm/product-categori-header', 
			dataType: 'json',
			contentType: 'application/json; charset=utf-8;',
			success : function(data) {
				console.log(data);
				$.each(data, function(index, key) {
					$(".main-menu").append(
						'<li>'+
							'<a href="/rudisfarm/product?type1='+key["type1"]+'">'+key["type1"]+'</a>'+
						'</li>'
					);
					
					$("#mobile-menu").append(
							'<li>'+
								'<a href="/rudisfarm/product?type1='+key["type1"]+'">'+key["type1"]+'</a>'+
							'</li>'
						);
				})
			},
			error: function(data) {
				console.log("에러 발생!");
			}
		});	
	})
	