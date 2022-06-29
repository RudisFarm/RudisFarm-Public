$(function() {
	
	$("#search").on("click", function(){
		var keyword = document.getElementById('search-input-text').value;
		
		var url = "/rudisfarm/product?page=1";
		
		if (keyword != "") {
			url = url + "&keyword=" + keyword;
		}
		location.href = url;
	});
	
});

var search_onclick_submit = function(){
	var keyword = document.getElementById('search-input-text').value;

	var url = "/rudisfarm/product?page=1";
	
	if (keyword != "") {
		url = url + "&keyword=" + keyword;
	}
	location.href = url;
};
