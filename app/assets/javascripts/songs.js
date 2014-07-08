$(document).ready(function(){

  $('#play').on("click", playsong);


  });

    function playsong(){
     $('#artist_info ul li').remove();
        
    $.ajax({
      type: "GET",
      url: "/search",
      data: {location: $("#location").val(), time: $('.ival').html()} ,
      dataType: 'json'
    }).done(function(data){
     
      data = data.playlist;

   
      duration = data[0][2]
      console.log(duration)
      duration = duration * 1000;
      console.log(duration)
      playlist = []
      artist_info = []
     for (var i=0; i<data.length; i++){
       playlist.push(data[i][1])
      }
      for (var i=0; i<data.length; i++){
       artist_info.push(data[i][0])
      }
      
      var baseUrl = "http://www.youtube.com/v/"
      var midUrl = "?autoplay=1&enablejsapi=1&version=3&loop=1&playlist="
      var fullUrl = baseUrl + playlist.shift() + midUrl + playlist.join(",")
      $('iframe').attr("src", fullUrl)
      $('#artist_info').css('color', 'red');


      // var video = swfobject.embedSWF(fullUrl)
       for (i in artist_info){

         $('#artist_info ul').append("<li>"+artist_info[i]+"</li>")
        }

         setTimeout(function() { playsong(); }, duration);
    })
    .fail(function(data){
      
      console.log("fail")
    
    })
 
}

// onYouTubePlayerReady = function (playerId) {
//     ytplayer = document.getElementById("myytplayer");
//     ytplayer.addEventListener("onStateChange", "onPlayerStateChange");
// };

// onPlayerStateChange = function (state) {
//     if (state === 0) {
//         alert("Stack Overflow rocks!");
//     }
// };

