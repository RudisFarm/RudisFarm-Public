$(function() {
	$("#cancelsearch").on("click", function(){
		
		var searchInputText = $("#search-input-text").val();
		
		if(!searchInputText) {
			location.href = "/rudisfarm/seller/seller-cancelpayment-manage";
		}else {
			location.href = "/rudisfarm/seller/seller-cancelpayment-manage?page="+1+"&keyword="+searchInputText;
		}
	});
});

var cancelsearch_onclick_submit = function(){
	
	var searchInputText = $("#search-input-text").val();
	
	if(!searchInputText) {
		location.href = "/rudisfarm/seller/seller-cancelpayment-manage";
	}else {
		location.href = "/rudisfarm/seller/seller-cancelpayment-manage?page="+1+"&keyword="+searchInputText;
	}
};