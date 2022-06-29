$(function() {
	
	$("#search").on("click", function(){
		var keyword = document.getElementById('search-input-text').value;
		var sort = $("#orderby option:selected").val();
		var keywordType = $("#keywordType option:selected").val();
/*		var type1 = document.getElementsByName("TYPE1")[0].value;
		var type2 = document.getElementsByName("TYPE2")[0].value;*/
/*		var status;*/
		
		/*if(document.getElementById('status')) {
			status = $("#orderby-status option:selected").val();
		}*/
		
		var url = window.location.href;
		var queryString = location.search;
		url = url.replace(queryString,"");
		url = url+"?page="+1;

		if (keyword != "") url = url + "&keyword=" + keyword;
		if (keywordType != "") url = url + "&keywordType=" + keywordType;
	/*	if (type1 != "") url = url + "&type1=" + type1;
		if (type2 != "") url = url + "&type2=" + type2;*/
		if (sort != "") url = url + "&sort=" + sort;
		
	/*	if(document.getElementById('status')) {*/
		/*	if (status != "") url = url + "&status=" + status;
		}*/
		
		location.href = url;
	});
});

var search_onclick_submit = function(){
	var keyword = document.getElementById('search-input-text').value;
	var keywordType = $("#keywordType option:selected").val();
	var sort = $("#orderby option:selected").val();
	/*		var type1 = document.getElementsByName("TYPE1")[0].value;
			var type2 = document.getElementsByName("TYPE2")[0].value;*/
	/*		var status;*/
			
			/*if(document.getElementById('status')) {
				status = $("#orderby-status option:selected").val();
			}*/
			
			var url = window.location.href;
			var queryString = location.search;
			url = url.replace(queryString,"");
			url = url+"?page="+1;

			if (keyword != "") url = url + "&keyword=" + keyword;
			if (keywordType != "") url = url + "&keywordType=" + keywordType;
		/*	if (type1 != "") url = url + "&type1=" + type1;
			if (type2 != "") url = url + "&type2=" + type2;*/
			if (sort != "") url = url + "&sort=" + sort;
		/*	if(document.getElementById('status')) {*/
			/*	if (status != "") url = url + "&status=" + status;
			}*/
			
			location.href = url;
};
