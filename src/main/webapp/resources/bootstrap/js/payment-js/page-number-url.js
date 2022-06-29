var pageUrl = function(page){
   var keyword = document.getElementById('search-input-text').value;
   
   var url = window.location.href;
   var queryString = location.search;
   url = url.replace(queryString,"");
   url = url+"?page="+page;

   if (keyword != "") url = url + "&keyword=" + keyword;
   
   
   location.href = url;
};
