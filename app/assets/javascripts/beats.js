
$(document).ready(function(){



$('#play').bind('ajax:error',playmusic)

});


function playmusic(e, data, status, xhr){

  debugger;
	console.log(data)
	$('iframe').attr("src", data.responseText)

};

