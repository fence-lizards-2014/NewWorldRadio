class Playlist

  def self.find_artists(params)
    artists = Echowrap.artist_search(:artist_start_year_after => params[:time], :artist_location => params[:location], :results => 10, :bucket => ["artist_location", "songs"])
  end

  def self.get_artist_songs(artists)
    songs = []
    artists.each do |artist|
      artist_name = artist.name.split(" ").join("+")
      songs << artist_name + "+" + artist.songs.sample.title.split(" ").join("+")
    end
    p songs
  end

  def self.get_song_ids(songs)
    playlist_ids = []
    songs.each do |song|
        response = HTTParty.get("http://gdata.youtube.com/feeds/api/videos?alt=json&fields=entry&max-results=2&v=2&q=#{song}&safeSearch=none&time=all_time&uploader=partner")
        video_id = response.parsed_response["feed"]["entry"].first["id"]['$t'].split(":").last
        # video_url = "https://www.youtube.com/embed/" + video_id+"?autoplay=1"

        # "http://www.youtube.com/v/#{video_id}autoplay=1&version=3&loop=1&playlist=LOMbySJTKpg,LOMbySJTKpg"
        playlist_ids << video_id
    end
    playlist_ids
  end

end