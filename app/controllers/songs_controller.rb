class SongsController < ApplicationController

	def index

    country_list = ["United States","Australia","Italy","Jamaica","Japan","United Kingdom"]

    i = 1942
    while (i <= 2014)
      country_list.each do |country|
        @playlist = Playlist.new(time: i.to_s, location: country)
        @playlist.save_station
      end
        i += 1
    end
  end

  def search
    p params
    @playlist = {}
    @playlist['songs'] = []
    @songs = Station.where(name: params[:time] +"_"+params[:location]).first.songs
    @songs.each do |song|
      @playlist['songs'] << {title: song.title, id: song.url_id}
    end
    p @playlist

   #   if (@playlist.play.empty?)

   #   	render json: {error: "error"}
   #   else
 	  render json: {playlist: @playlist}
 	 # end
  end

end

