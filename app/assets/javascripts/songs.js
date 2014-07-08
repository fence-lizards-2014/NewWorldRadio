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
      // debugger
      console.log(data)
      console.log(data.playlist)
      var baseUrl = "http://www.youtube.com/v/"
      var midUrl = "?autoplay=1&version=3&loop=1&playlist="
      var fullUrl = baseUrl + data.playlist.shift() + midUrl + data.playlist.join(",")
      $('iframe').attr("src", fullUrl)
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

