$(function() {
		$.ajax({
			type : 'POST',
			url : '/rudisfarm/product-randomlist',
			dataType : 'json',
			contentType : 'application/json; charset=utf-8;',
			async: false,
			success : function(data) {
				console.log(data);
				$.each(data, function(index, key) {
					$('#order-product').append(
							'<div class="product-item text-center">'+
								'<div class="product-thumb">'+
									'<a href="/rudisfarm/product/'+key["product_ID"]+'">'+
										'<img src="/rudisfarm/resources/upload/images/product/'+key["product_ID"]+'/'+key["sumnail"]+'" alt="" style="max-width:100%; height:260px;"/>'+
									'</a>'+
									'<div class="product-action">'+
										'<span class="add-to-cart">'+
											'<a href="/rudisfarm/product/'+key["product_ID"]+'" data-toggle="tooltip" data-placement="top" title="장바구니 담기"></a>'+
										'</span>'+
									'</div>'+
								'</div>'+
								'<div class="product-info">'+
									'<a href="/rudisfarm/product/'+key["product_ID"]+'">'+
										'<h2 class="title">'+key["name"]+'</h2>'+
										'<span class="price">'+key["price"]+'</span>'+
									'</a>'+
								'</div>'+
							'</div>'
					);
				});
			},
			error : function(data) {
				console.log(data);
				console.log("에러 발생!");
			}
		});
	})
