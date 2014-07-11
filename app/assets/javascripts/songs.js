$(document).ready(function(){
  var tag = document.createElement('script');
  tag.src = "https://www.youtube.com/iframe_api";
  var firstScriptTag = document.getElementsByTagName('script')[0];
  firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
  // $(('#play')[0]).on("submit", playsong);
  // $("#click").remove();
  hideLoadingThing();
  year_triggered = false;
});

function playsong(event){
  $('#player').remove();
  $('#artist_info li').remove();

  loc = $('.ival')[0].innerHTML
  time =  parseInt($('.knob').val())
  event.preventDefault();
  $.ajax({
    type: "GET",
    url: "/search",
    // data: {location: $("#location").val(), time: $('.ival').html()} ,
    data: {location: loc, time: parseInt($('.knob').val())} ,

    dataType: 'json'
  }).done(function(data){

    if(data.error === "error")
    {
       $('#artist_info ul').append("<li>Please search again</li>");
       $('iframe').attr("src",'');
    }
    else {
      playlist_song = data.playlist['song'];
      playlist_id = data.playlist['id'];
      duration = data.playlist['duration'] * 1000;
      var baseUrl = "http://www.youtube.com/v/";
      var endUrl = "?version=3&autoplay=1";
      var fullUrl = baseUrl + playlist_id + endUrl;
      // $('iframe').attr("src", fullUrl)
      var player_div = '<iframe id="player" type="text/html" width="0" height="0" src="https://www.youtube.com/embed/'+data.playlist['id']+'?enablejsapi=1"frameborder="0"></iframe>'
        $('#artist_info ul').append("<li>"+playlist_song+"</li>");
      $('body').append(player_div);

      onYouTubeIframeAPIReady();
      var player;
      function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', {
          events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
          }
        });
      }
      function onPlayerReady(event) {
         
        // event.target.playVideo();
       
        // $('iframe').css("width", "0px");
        var play_button = '<a href="/play" id="click" style="display:none;">Click Me</a>'
        $('body').append(play_button);
var player_div = '<iframe id="player" type="text/html" width="0" height="0" src="https://www.youtube.com/embed/'+data.playlist['id']+'?enablejsapi=1"frameborder="0"></iframe>'
       setTimeout(function(){$("#click").on("click", playMe());}, 1000);
         $("#click").trigger('click');
        // event.target.playVideo();
      }
      function playMe(event){
        
        player.playVideo();
      }
      // 5. The API calls this function when the player's state changes.
      //    The function indicates that when playing a video (state=1),
      //    the player should play for six seconds and then stop.
      var done = false;
      function onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.PLAYING && !done) {
          setTimeout(stopVideo, duration);
          done = true;
        }
      }
      function stopVideo() {
        player.stopVideo();
        playsong(event);
      }
    }
  }).fail(function(data){
    // console.log(data)
    hideLoadingThing();
    console.log("fail");
    console.log(data.responseText)
  })
}

function hideLoadingThing(){
  $('.ui-loader').css("display", 'none');
}



  // $('#artist_info li').remove();
  // loc=  $('.ival')[0].innerHTML
  //  time =  parseInt($('.knob').val())
  // event.preventDefault();
  // $.ajax({
  //   type: "GET",
  //   url: "/search",
  //   // data: {location: $("#location").val(), time: $('.ival').html()} ,
  //   data: {location: $('.ival')[0].innerHTML, time: parseInt($('.knob').val())} ,

  //   dataType: 'json'
  // }).done(function(data){

  //   if(data.error === "error")
  //   {
  //      $('#artist_info ul').append("<li>No Data available.Please search again</li>");
  //       $('iframe').attr("src",'');
  //   }
  //   else{
  //   playlist_song = data.playlist['song'];
  //   playlist_id = data.playlist['id'];
  //   duration = data.playlist['duration'] * 1000;
  //   var baseUrl = "http://www.youtube.com/v/";
  //   var endUrl = "?version=3&autoplay=1";
  //   var fullUrl = baseUrl + playlist_id + endUrl;
  //   hideLoadingThing();
  //   $('iframe').attr("src", fullUrl);

  //   $('#artist_info ul').append("<li>"+playlist_song+"</li>");
  //   setTimeout(function() { playsong(); }, duration)
  // }
  // })
  // .fail(function(data){
  //   // console.log(data)
  //   hideLoadingThing();
  //   console.log("fail");
  //   console.log(data.responseText)
  // })
// }



