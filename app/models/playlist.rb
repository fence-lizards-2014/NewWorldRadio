class Playlist

  attr_accessor :artists, :songs, :youtube_que

  def initialize(params)
    @time = params[:time].to_i
    @location = params[:location]
    @artists = []
    @songs = []
    @title = ''
    @youtube_que = ''
    @duration = ''
    @playlist = {}
    find_artists
    find_songs
    verify_songs
    # play
  end

  def find_artists
    @artists = Echowrap.artist_search(
                :artist_location => @location,
                :artist_start_year_after => (@time - 10),
                :artist_end_year_before => (@time + 10),
                :results => 1, :bucket => ["songs"]).shuffle
  end

  def find_songs
    @artist1 = @artists.pop
    p @songs << Echowrap.artist_video(:name => @artist1.name, :results => 1).flatten.first
    @title = @songs.flatten.first.title
  end

  def verify_songs
    if @songs.first.site === "youtube.com"
      url = @songs.first.url
      split = url.split("=")
      split2 = split[1].split("&")
      @youtube_que = split2[0]
    end
    p @youtube_que
  end

  def play

      response = HTTParty.get("http://gdata.youtube.com/feeds/api/videos/#{@youtube_que}?alt=json&v=2")
      puts "before"
      @duration = response.parsed_response['entry']['media$group']['media$content'][0]["duration"]
      # ['media$content'][0]["duration"]
      # [0]['media$group']['media$content'][0]["duration"]
      # @duration = response.parsed_response["feed]['entry'][0]['media$group']['media$content'][0]["duration"]
      # p @duration
      # feed = response.parsed_response["feed"]["entry"]
      # if !feed.nil?
      #   video_id = feed.first["id"]['$t'].split(":").last
      #   @playlist_ids << video_id
      # end
      @playlist["song"] = @title
      @playlist["id"] = @youtube_que
      @playlist["duration"] = @duration
      @playlist
     # [@title, @youtube_que, @duration]
  end
end
