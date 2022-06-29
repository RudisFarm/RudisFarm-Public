function comma(str) {
	     str = String(str);
	     return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	 }

$(function() {
	var user_id = $('#user_id').val(); 
	
	$.ajax({
		type : 'POST',
		url : '/rudisfarm/product-orderlist',
		dataType : 'json',
		contentType : 'application/json; charset=utf-8;',
		async: false,
		data : JSON.stringify({
			USER_ID : user_id
		}),
		success : function(data) {
			var image;
			$.each(data, function(index, key) {
				if(key["sumnail"] == "") { //썸네일이 없을 경우
					image="/rudisfarm/resources/upload/images/default.png";
				} else {
					image='"/rudisfarm/resources/upload/images/product/'+key["product_ID"]+'/'+key["sumnail"]+'"';
				}
				
				$('#order-product').append(
						'<div class="product-item text-center">'+
							'<div class="product-thumb">'+
								'<a href="/rudisfarm/product/'+key["product_ID"]+'">'+
									'<img src='+image+' alt="" style="max-width:100%; height:260px;"/>'+
								'</a>'+
							'</div>'+
							'<div class="product-info">'+
								'<a href="/rudisfarm/product/'+key["product_ID"]+'">'+
									'<h2 class="title">'+key["product_NAME"]+'</h2>'+
									'<span class="price">'+comma(key["price"])+'원</span><br>'+
									'<span class="price" style="color:#FFA500">'+key["weight"]/1000.0+'kg</span>'+
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

//								'<div class="badges">'+
//									'<span class="hot">Hot</span>'+
//								'</div>'+