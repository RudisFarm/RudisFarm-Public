$(function() {
	$("#canceladminsearch").on("click", function(){
		var searchInputText = $("#search-input-text").val();
		var keywordType = $("#keywordType option:selected").val();
		
		if(!searchInputText) {
			location.href = "/rudisfarm/admin/admin-canceledpaymentlist-manage";
		}else {
			location.href = "/rudisfarm/admin/admin-canceledpaymentlist-manage?page="+1+"&keyword="+searchInputText+"&keywordType="+keywordType;
		}
	});
});

var search_onclick_submit = function(){
	var searchInputText = $("#search-input-text").val();
	var keywordType = $("#keywordType option:selected").val();
	
	if(!searchInputText) {
		location.href = "/rudisfarm/admin/admin-canceledpaymentlist-manage";
	}else {
		location.href = "/rudisfarm/admin/admin-canceledpaymentlist-manage?page="+1+"&keyword="+searchInputText+"&keywordType="+keywordType;
	}
};