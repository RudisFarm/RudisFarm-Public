function comma(str) {
	     str = String(str);
	     return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	 }

$(function() {
		$.ajax({
			type : 'POST',         
			url: '/rudisfarm/my-page/my-cart-list', 
			dataType: 'json',
			contentType: 'application/json; charset=utf-8;',
			success : function(data) {
				var image="";
				$('.cart-list').children().remove();
				
				if(data["result"] > 0) {
					$(".mini-cart-icon").attr('data-count',data["list"].length);
					$.each(data["list"], function(index, key) {
						
						if(key["sumnail"] == "") { //썸네일이 없을 경우
							image="/rudisfarm/resources/upload/images/default.png";
						} else {
							image="/rudisfarm/resources/upload/images/product/"+key["product_ID"]+"/"+key["sumnail"];
						}	
						
						$(".cart-list").append(
							'<li id="'+key["cart_ID"]+'">'+
								'<a href="javascript:void(0);" class="remove" onclick="click_remove('+key["cart_ID"]+')">×</a>'+
								'<a href="/rudisfarm/product/'+key["product_ID"]+'">'+
									'<img src="'+image+'" alt="" />'+
									key["product_NAME"]+
								'</a>'+
								'<span>'+key["count"]+' 개</span>'+
								'<span class="quantity">'+comma(key["price"])+'원</span>'+
							'</li>'
						);
					})
					$(".amount").text("");
					$(".amount").text(comma(data["sumMoney"])+"원");
					
				}
			},
			error: function(data) {
				console.log("장바구니 에러 발생!");
			}
		});
		
})

		function click_remove(cartid){
			$.ajax({
				type : 'DELETE',         
				url: '/rudisfarm/my-page/my-cart', 
				dataType: 'json',
				contentType: 'application/json; charset=utf-8;',
				data : JSON.stringify({
					CART_ID : cartid
				
				}),
				
				success : function(data) {
					console.log("수신 성공");
					console.log(data);
					location.reload();				
					
				},
				error: function(data) {
					console.log("에러 발생!");
					console.log(data)
				}
			});
		}