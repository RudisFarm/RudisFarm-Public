function comma(str) {
	     str = String(str);
	     return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	 }

$(function() {
	
	var kategorie = new Map();
		
	// 카테고리 값 가져오기
	$.ajax({
		type : 'POST',
		url : '/rudisfarm/product-randomlist',
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
				
				  
				  
				
				  
				
				$('#category-carousel').append(
					'<div class="cat-item">'+
						'<div class="cats-wrap" data-bg-color="#CEF6CE">'+
							'<a href="/rudisfarm/product/'+key["product_ID"]+'">'+
								'<img src='+image+' alt="" style="width:150px; height:150px; border: 3px solid #D3D3D3;"/>'+
								'<h2 class="category-title" style="color:#585858; white-space:nowrap; text-overflow:ellipsis; word-wrap:normal; overflow:hidden;">'+
								key["product_NAME"]+'<br><mark class="count" style="color:#585858">'+comma(key["price"])+'원</mark><br>'+
								' <mark class="count" style="color:#585858">'+key["weight"]/1000.0+'kg</mark>'+
								'</h2>'+
							'</a>'+
						'</div>'+
					'</div>'
				);

				kategorie.set(index, key);
			});
		},
		error : function(data) {
			console.log("에러 발생!");
		}
	});
})
