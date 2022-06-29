$(function() {
	$("select[name=orderby]").change( function() {
		var value = $("select[name=orderby] option:selected").val();
		
		location.href = "/rudisfarm/product?page=1&sort="+value;
	});
})
