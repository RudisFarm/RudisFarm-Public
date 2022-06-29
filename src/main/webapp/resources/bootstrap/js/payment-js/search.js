$(function() {
	$("#search").on("click", function(){
		
		var searchInputText = $("#search-input-text").val();
		
		if(!searchInputText) {
			location.href = "/rudisfarm/seller/seller-payment-manage";
		}else {
			location.href = "/rudisfarm/seller/seller-payment-manage?page="+1+"&keyword="+searchInputText;
		}
	});
});

var search_onclick_submit = function(){
	
	var searchInputText = $("#search-input-text").val();
	
	if(!searchInputText) {
		location.href = "/rudisfarm/seller/seller-payment-manage";
	}else {
		location.href = "/rudisfarm/seller/seller-payment-manage?page="+1+"&keyword="+searchInputText;
	}
};