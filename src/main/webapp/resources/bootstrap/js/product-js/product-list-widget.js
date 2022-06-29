function comma(str) {
	     str = String(str);
	     return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	 }


$(function() {
	
		$.ajax({
			type : 'POST',
		url : '/rudisfarm/product-randomlistside',
		dataType : 'json',
		contentType : 'application/json; charset=utf-8;',
		async: false,
		success : function(data) {
			console.log(data)
			var image="";
			$.each(data, function(index, key) {
				
				if(key["sumnail"] == "") { //썸네일이 없을 경우
					image="/rudisfarm/resources/upload/images/default.png";
				} else {
					image='"/rudisfarm/resources/upload/images/product/'+key["product_ID"]+'/'+key["sumnail"]+'"';
				}
				
				$('#product-list-widget').append(
					'<li>'+
						'<a href="/rudisfarm/product/'+key["product_ID"]+'">'+
							'<img src='+image+' alt="" style="width:100px; height:100px;"/>'+
							'<span class="product-title">'+key["product_NAME"]+'</span>'+
						'</a>'+
						'<ins>'+comma(key["price"])+'원</ins><br>'+
						'<ins style="color:#FFA500;">'+key["weight"]/1000.0+'kg</ins>'+
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
