$(function() {
	var kategorie = new Map();
		
		// 카테고리 값 가져오기
		$.ajax({
			type : 'POST',
			url : '/rudisfarm/product-type',
			dataType : 'json',
			contentType : 'application/json; charset=utf-8;',
			async: false,
			//data : JSON.stringify(form),
			success : function(data) {
				console.log(data);
				$.each(data, function(index, key) {
					$('#category-carousel').append(
						'<div class="cat-item">'+
							'<div class="cats-wrap" data-bg-color="#e0d1a1">'+
								'<a href="/rudisfarm/product?page=1&type1='+index+'">'+
									'<img src="/rudisfarm/resources/bootstrap/images/category/'+index+'.jpg" alt="" style="width:150px; height:150px;"/>'+
									'<h2 class="category-title">'+
										index+' <mark class="count">('+key.length+')</mark>'+
									'</h2>'+
								'</a>'+
							'</div>'+
						'</div>'
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
