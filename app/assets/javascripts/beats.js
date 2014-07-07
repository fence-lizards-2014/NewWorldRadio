
$(document).ready(function(){

    $('#play').on("click", function(e){
    e.preventDefault();
    $.ajax({
      type: "GET",
      url: "/search",
      data: {location: "New York", time: $('.ival').html() }
    }).fail(function(data){
      $('iframe').attr("src", data.responseText)
    })
  })
})

  // function success(response){
  //   console.log(response)
  // }


  // $('#play').bind('ajax:success',playmusic)




function playmusic(e, data, status, xhr){

  debugger;
	console.log(data)
	$('iframe').attr("src", data.responseText)

};

