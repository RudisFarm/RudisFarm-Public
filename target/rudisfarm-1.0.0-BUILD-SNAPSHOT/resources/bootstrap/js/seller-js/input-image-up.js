	var serialUpload = document.getElementsByName('serial-image')[0]
		serialHolder = document.getElementById('serial-holder')

	var thumUpload = document.getElementsByName('thum-image')[0]
		thumHolder = document.getElementById('thum-holder')
	
	var descUpload = document.getElementsByName('desc-image')[0],
		descHolder = document.getElementById('desc-holder')
	    
	var state = document.getElementById('status');
	
	if (typeof window.FileReader === 'undefined') {
	  state.className = 'fail';
	} else {
	  state.className = 'success';
	  state.innerHTML = 'File API & FileReader available';
	}
	
	serialUpload.onchange = function (e) {
	  e.preventDefault();
	
	  var file = serialUpload.files[0],
	      reader = new FileReader();
	  reader.onload = function (event) {
	    var img = new Image();
	    img.src = event.target.result;
	    // note: no onload required since we've got the dataurl...I think! :)
	      img.width = 250;
       serialHolder.innerHTML = '';
       serialHolder.appendChild(img);
	  };
	  reader.readAsDataURL(file);
	
	  return false;
	};
	 
	thumUpload.onchange = function (e) {
	  e.preventDefault();
	
	  var file = thumUpload.files[0],
	      reader = new FileReader();
	  reader.onload = function (event) {
	    var img = new Image();
	    img.src = event.target.result;
	    // note: no onload required since we've got the dataurl...I think! :)
	      img.width = 250;
	   thumHolder.innerHTML = '';
	   thumHolder.appendChild(img);
	  };
	  reader.readAsDataURL(file);
	
	  return false;
	};
	
	descUpload.onchange = function (e) {
		  e.preventDefault();
		
		  var file = descUpload.files[0],
		      reader = new FileReader();
		  reader.onload = function (event) {
		    var img = new Image();
		    img.src = event.target.result;
		    // note: no onload required since we've got the dataurl...I think! :)
		      img.width = 250;
		   descHolder.innerHTML = '';
		   descHolder.appendChild(img);
		  };
		  reader.readAsDataURL(file);
		
		  return false;
		};
