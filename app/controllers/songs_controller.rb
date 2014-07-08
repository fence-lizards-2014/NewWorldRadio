class SongsController < ApplicationController

	def index
  end

	def search
    @playlist = Playlist.new(params)
 	  render json: {playlist: @playlist.youtube_que}
  end

end

