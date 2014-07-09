class SongsController < ApplicationController

	def index
  end

	def search
     @playlist = Playlist.new(params)
     if (@playlist.play.empty?)
     	
     	render json: {error: "error"}
     else
 	  render json: {playlist: @playlist.play}
 	 end
  end

end

