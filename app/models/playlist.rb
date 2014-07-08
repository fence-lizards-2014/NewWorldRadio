class Playlist

  attr_accessor :artists, :songs, :youtube_que

  def initialize(params)
    @time = params[:time].to_i
    @location = params[:location]
    @artists = []
    @songs = []
    @current_artist = ""
    @current_song = ""
    @current_song_title = ''
    @youtube_que = ''
    @duration = ''
    @playlist = {}
    @played_artists = []
    @played_songs = []
    find_artists
    find_current_artist
    find_songs
    find_current_song
    get_current_song_id
    get_current_song_duration
    ready_play
  end

  def find_artists
    @artists = Echowrap.artist_search(
                :artist_location => @location,
                :artist_start_year_after => (@time - 10),
                :artist_end_year_before => (@time + 10),
                :results => 50, :bucket => ["songs"]).shuffle
  end

  def find_current_artist
    @current_artist = @artists.pop
    @played_artists << @current_artist
  end

  def find_songs
    potential_songs = []
    potential_songs << Echowrap.artist_video(:name => @current_artist.name, :results => 20).flatten.shuffle
    verify_songs(potential_songs)
  end

  def find_current_song
    p @current_song = @songs.flatten.shuffle.first
    p @current_song_title = @current_song.title
  end

  def verify_songs(potential_songs)
    potential_songs.flatten.each do |song|
      if song.site === "youtube.com"
        @songs << song
      end
    end
    @songs
  end

  def get_current_song_id
    url = @current_song.url
    split = url.split("=")
    split2 = split[1].split("&")
    @youtube_que = split2[0]
  end

  def get_current_song_duration
    response = HTTParty.get("http://gdata.youtube.com/feeds/api/videos/#{@youtube_que}?alt=json&v=2")
    @duration = response.parsed_response['entry']['media$group']['media$content'][0]["duration"]
  end

  def ready_play
      @playlist["song"] = @current_song_title
      @playlist["id"] = @youtube_que
      @playlist["duration"] = @duration
  end

  def play
    @playlist
  end
end
