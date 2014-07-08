class SongsController < ApplicationController

	def index
  end

	def search
    @playlist = Playlist.new(params)
 	  render json: {playlist: @playlist.play}
  end

end

