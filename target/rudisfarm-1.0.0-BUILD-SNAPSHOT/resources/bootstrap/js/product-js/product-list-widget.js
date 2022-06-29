$(function() {
		$.ajax({
			type : 'POST',
			url : '/rudisfarm/product-randomlist',
			dataType : 'json',
			contentType : 'application/json; charset=utf-8;',
			success : function(data) {
				console.log(data);
				$.each(data, function(index, key) {
					$('.product-list-widget').append(
						'<li>'+
							'<a href="/rudisfarm/product/'+key["product_ID"]+'">'+
								'<img src="/rudisfarm/resources/upload/images/product/'+key["product_ID"]+'/'+key["sumnail"]+'" alt="" style="width:100px; height:100px;"/>'+
								'<span class="product-title">'+key["name"]+'</span>'+
							'</a>'+
							'<ins>'+key["price"]+'</ins>'+
						'</li>'
					);
				});
			},
			error : function(data) {
				console.log(data);
				console.log("에러 발생!");
			}
		});
	})
