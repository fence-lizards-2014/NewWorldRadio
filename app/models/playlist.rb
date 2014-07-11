class Playlist

  attr_accessor :time, :location, :name

  def initialize(params)
    @location = params[:location]
    @time = params[:time]
    @station = Station.new(name: @time+"_"+@location, location: @location, time: @time)
    @name = @time + "_" + @location
    @artists = []
    @songs = []
    @current_song_title = ''
    @youtube_que = []
    find_artists
    find_songs
  end

  def find_artists
    @artists = Echowrap.artist_search(
                :artist_location => @location,
                :artist_start_year_after => (@time.to_i - 1),
                :results => 2,
                :sort => "artist_start_year-asc",
                :bucket => ["songs", "years_active"])
  end

  def find_songs
    @artists.each do |artist|
      verify_songs(Echowrap.artist_video(:name => artist.name, :results => 1).flatten)
    end
    @youtube_que
  end

  def verify_songs(potential_songs)
    potential_songs.flatten.each do |song|
      if song.site === "youtube.com"
        url = song.url
        split = url.split("=")
        split2 = split[1].split("&")
        @youtube_que << [song.title, split2[0]]
      end
    end
  end

  def save_station
    @youtube_que.each do |song|
      @station.songs << Song.new(title: song.first, url_id: song.last)
    end
    if @station.songs.length == 0
      @station.songs << Song.new(title: "No song availabe for this place and time", url_id: "FAKE_ID")
      @station.songs.first
    end
    if @station.save
      puts "...................................................................."
      puts "Saved #{@station.name} with #{@station.songs.length} songs"
      puts "#{@station.songs.all}"
      puts "...................................................................."
      puts "...................................................................."
      (1..20).to_a.each do |i|
        puts i
        sleep(1)
      end
    else
      puts "something happened"
    end
  end
end

# years = (1942..1943).to_a
# yeas.each do |year|
#   @playlist = Playlist.new({time: year.to_s, location: "United States"})
#   if @playlist.save
#     sleep(60)
#   else
#     puts "something happened"
#   end
#   p Playlist.all
# end







# class Playlist

#   attr_accessor :artists, :songs, :youtube_que

#   def initialize(params)
#     @time = params[:time].to_i
#     @location = params[:location]
#     @artists = []
#     @songs = []
#     @current_artist = ""
#     @current_song = ""
#     @current_song_title = ''
#     @youtube_que = ''
#     @duration = ''
#     @playlist = {}
#     @played_artists = []
#     @played_songs = []
#     if (find_artists.empty?)
#       @error = "No data found"
#     else
#       find_current_artist
#         if(find_songs.empty?)
#           @error = "No data found"
#         else
#           find_current_song
#           get_current_song_id
#           get_current_song_duration
#           ready_play
#         end
#     end

#   end

#   def find_artists
#     puts "before"
#     @artists = Echowrap.artist_search(
#                 :artist_location => @location,
#                 :artist_start_year_after => (@time - 10),
#                 :artist_end_year_before => (@time + 10),
#                 :results => 50, :bucket => ["songs"]).shuffle
#   end

#   def find_current_artist
#     @current_artist = @artists.pop
#     @played_artists << @current_artist
#   end

#   def find_songs
#     potential_songs = []
#     potential_songs << Echowrap.artist_video(:name => @current_artist.name, :results => 20).flatten.shuffle
#     verify_songs(potential_songs)
#   end

#   def find_current_song
#     p @current_song = @songs.flatten.shuffle.first
#     p @current_song_title = @current_song.title
#   end

#   def verify_songs(potential_songs)
#     potential_songs.flatten.each do |song|
#       if song.site === "youtube.com"
#         @songs << song
#       end
#     end
#     @songs
#   end

#   def get_current_song_id
    # url = @current_song.url
    # split = url.split("=")
    # split2 = split[1].split("&")
    # @youtube_que = split2[0]
#   end

#   def get_current_song_duration
#     response = HTTParty.get("http://gdata.youtube.com/feeds/api/videos/#{@youtube_que}?alt=json&v=2")
#     @duration = response.parsed_response['entry']['media$group']['media$content'][0]["duration"]
#   end

#   def ready_play
#       @playlist["song"] = @current_song_title
#       @playlist["id"] = @youtube_que
#       @playlist["duration"] = @duration
#   end

#   def play
#     @playlist
#   end
# end
