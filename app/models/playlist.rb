class Playlist

  def self.find_artists(params)
    artists = Echowrap.artist_search(:artist_start_year_after => (params[:time].to_i - 10).to_s, :artist_end_year_before => (params[:time].to_i + 10).to_s, :artist_location => params[:location], :results => 5, :bucket => ["artist_location", "songs"]).shuffle
  end

  def self.get_artist_songs(artists)
    songs = []
    @artist_data = []
    artists.length
    artists.each do |artist|
      if artist.songs.length >= 1
        p artist
        title = artist.songs.sample.title.gsub(/[^0-9a-z]/i, '+')
        titlee = artist.songs.sample.title
        artist_title = "Playing #{titlee} by #{artist.name}"
        @artist_data << [artist_title]
        # @artist_data << [artist.name title]
        artist_name = artist.name.split(" ").join("+")
        songs << artist_name + "+" + title

      end
    end
    songs
  end

  def self.get_song_ids(songs)
    playlist_ids = []
    songs.each_with_index do |song,idx|
      response = HTTParty.get("http://gdata.youtube.com/feeds/api/videos?alt=json&fields=entry&max-results=2&v=2&q=#{song}&safeSearch=none&time=all_time&uploader=partner")
      feed = response.parsed_response["feed"]["entry"]
      if !feed.nil?
        video_id = feed.first["id"]['$t'].split(":").last
        playlist_ids << video_id
        p @artist_data[idx] << video_id
      end
    end
    @artist_data
  end

end