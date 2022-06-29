var pageUrl = function(page){
	var keyword = document.getElementById('search-input-text').value;
	var type1 = document.getElementById('type1').value;
	var type2 = document.getElementById('type2').value;
	var sort = document.getElementById('sort').value;
	
	if(type1 != "") {
		location.href = "/rudisfarm/product?page="+page+"&type1="+type1+"&sort="+sort;
	} else if(keyword != ""){
		location.href = "/rudisfarm/product?page="+page+"&keyword="+keyword+"&sort="+sort;
	} else if(type2 != "") {
		location.href = "/rudisfarm/product?page="+page+"&type2="+type2+"&sort="+sort;
	} else {
		location.href = "/rudisfarm/product?page="+page+"&sort="+sort;
	}
};




