$(document).ready(function(){
  $('#play').on("submit", playsong);
});

function playsong(event){
    $('#artist_info li').remove();

  loc=  $('.ival')[0].innerHTML
   time =  parseInt($('.knob').val())
  event.preventDefault();
  $.ajax({
    type: "GET",
    url: "/search",
    // data: {location: $("#location").val(), time: $('.ival').html()} ,
    data: {location: $('.ival')[0].innerHTML, time: parseInt($('.knob').val())} ,

    dataType: 'json'
  }).done(function(data){
  
    if(data.error === "error")
    {
       $('#artist_info ul').append("<li>No Data available.Please search again</li>");
        $('iframe').attr("src",'');
    }
    else{
    playlist_song = data.playlist['song'];
    playlist_id = data.playlist['id'];
    duration = data.playlist['duration'] * 1000;
    var baseUrl = "http://www.youtube.com/v/";
    var endUrl = "?version=3&autoplay=1";
    var fullUrl = baseUrl + playlist_id + endUrl;
    $('iframe').attr("src", fullUrl);
  
    $('#artist_info ul').append("<li>"+playlist_song+"</li>");
    setTimeout(function() { playsong(); }, duration)
  }
  })
  .fail(function(data){
    // console.log(data)
    console.log("fail");
    console.log(data.responseText)
  })
}



