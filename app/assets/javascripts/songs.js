
$(document).ready(function(){

    $('#play').on("click", function(e){
    e.preventDefault();
    $.ajax({
      type: "GET",
      url: "/search",
      data: {location: $("#location").val(), time: $('.ival').html()} ,
      dataType: 'json'
    }).done(function(data){
      console.log("done")
      console.log(data.video_url)
      $('iframe').attr("src", data.video_url)

    })
    .fail(function(data){

      console.log(data)
      console.log("fail")
      console.log(data.responseText)
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

