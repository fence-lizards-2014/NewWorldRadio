
$(document).ready(function(){



$('#play').bind('ajax:error',playmusic)

});


function playmusic(e, data, status, xhr){
 

	console.log(data)
	$('iframe').attr("src", data.response)

};

