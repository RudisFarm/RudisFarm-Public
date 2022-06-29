$(function() {
	$("#search").on("click", function(){
		
		var searchInputText = $("#search-input-text").val();
		
		if(!searchInputText) {
			location.href = "/rudisfarm/product";
		}else {
			location.href = "/rudisfarm/product?page="+1+"&keyword="+searchInputText;
		}
	});
});

var search_onclick_submit = function(){
	
	var searchInputText = $("#search-input-text").val();
	
	if(!searchInputText) {
		location.href = "/rudisfarm/product";
	}else {
		location.href = "/rudisfarm/product?page="+1+"&keyword="+searchInputText;
	}
};