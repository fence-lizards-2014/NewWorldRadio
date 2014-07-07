require 'youtube_it'

class SongsController < ApplicationController

	def index

	end

	def search

		@artists = Echowrap.artist_search(:artist_start_year_after => params[:time], :artist_location => params[:location], :results => 10, :bucket => ["artist_location", "songs"])
		p @artists
		@songs = [];
		@artists.each do |artist|
			@songs << artist.songs.sample.title.split(" ").join("+")
		end
		p @songs
		# @title = @artists.sample.songs.sample.title
		# @title = @title.split(" ").join("+")
		@playlist = []
		@songs.each do |song|
			p response = HTTParty.get("http://gdata.youtube.com/feeds/api/videos?alt=json&fields=entry&max-results=2&v=2&q=#{song}&safeSearch=none&time=all_time&uploader=partner")
		 	@video_id = response.parsed_response["feed"]["entry"].first["id"]['$t'].split(":").last
		 	@video_url = "https://www.youtube.com/embed/" + @video_id+"?autoplay=1"
		 	@playlist << @video_url
		end
		p @playlist

 		render json: {playlist: @playlist}
	end


end
