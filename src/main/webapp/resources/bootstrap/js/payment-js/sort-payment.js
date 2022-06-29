$(function() {
	
	$.ajax({
		type : 'POST',
		url : '/rudisfarm/payment-sort',
		dataType : 'json',
		contentType : 'application/json; charset=utf-8;',
		async: false,
		success : function(data) {
			$.each(data, function(index, key) {
				$("#orderby").append("<option value="+key+">"+index+"</option>");
			});
		},
		error : function(data) {
			console.log("에러 발생!");
			console.log(data);
		}
	});
	
	//서버에서 값을 받아와야함
	var sort = document.getElementById('sort').value;
	$("#orderby").val(sort).prop("selected", true);
	
	$("#orderby").change(function() {
		var keyword = document.getElementById('search-input-text').value;
		var sort = $("#orderby option:selected").val();
		
		var url = window.location.href;
		var queryString = location.search;
		url = url.replace(queryString,"");
		url = url+"?page="+1;

		if (keyword != "") url = url + "&keyword=" + keyword;
		if (sort != "") url = url + "&sort=" + sort;
		
		location.href = url;
	});
})
