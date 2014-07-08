class Playlist

  attr_accessor :artists, :songs, :youtube_que

  def initialize(params)
    @time = params[:time].to_i
    @location = params[:location]
    @artists = []
    @songs = []
    @youtube_que = []
    find_artists
    find_songs
    verify_songs
    play
  end

  def find_artists
    @artists = Echowrap.artist_search(
                :artist_location => @location,
                :artist_start_year_after => (@time - 10),
                :artist_end_year_before => (@time + 10),
                :results => 15, :bucket => ["songs"]).shuffle
  end

  def find_songs
    @artists.each do |artist|
       @songs << Echowrap.artist_video(:name => artist.name, :results => 1)
    end
    p @songs
  end

  def verify_songs
    @songs.flatten.each do |video|
      if video.site === "youtube.com"
        url = video.url
        split = url.split("=")
        split2 = split[1].split("&")
        @youtube_que << split2[0]
      end
    end
    @youtube_que
  end

  def play
    p @youtube_que
  end

end