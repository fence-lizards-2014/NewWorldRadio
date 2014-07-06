require 'youtube_it'

class BeatsController < ApplicationController

	def index
		# client = YouTubeIt::Client.new(:username => "dominick oddo", :password =>  "youtube_passwd", :dev_key => "developer_key")

	end

	def search
		puts "In YouTube"
		# p params
		# p params["track"]
		@artist = Echowrap.artist_search(:artist_start_year_after => params[:time], :artist_location => params[:location], :bucket => ["artist_location", "songs"])
		p	@artist


		# @song =  Echowrap.song_search(:artist => params[:track], :results => 3)
		@title = @artist.sample.songs.sample.title
		@title = @title.split(" ").join("+")
		p @title
		response = HTTParty.get("http://gdata.youtube.com/feeds/api/videos?alt=json&fields=entry&max-results=2&v=2&q=#{@title}&safeSearch=none&time=all_time&uploader=partner")
	  p video_id = response.parsed_response["feed"]["entry"].first["id"]['$t'].split(":").last
		# response = HTTParty.get("https://partner.api.beatsmusic.com/v1/api/search?type=track&q=#{@title}&client_id=yupuktqwpjsbdka36drye9fv")

		# @song_id = data["data"].first["id"]
		# puts @song_id
		redirect_to root_path
	end


end
