require 'youtube_it'

class BeatsController < ApplicationController

	def index
		# client = YouTubeIt::Client.new(:username => "dominick oddo", :password =>  "youtube_passwd", :dev_key => "developer_key")

	end

	def search
		puts "In YouTube"
		p params
		# # p params["track"]
		@artist = Echowrap.artist_search(:artist_start_year_after => params[:time], :artist_location => params[:location], :bucket => ["artist_location", "songs"])

		@title = @artist.sample.songs.sample.title
		@title = @title.split(" ").join("+")

		response = HTTParty.get("http://gdata.youtube.com/feeds/api/videos?alt=json&fields=entry&max-results=2&v=2&q=#{@title}&safeSearch=none&time=all_time&uploader=partner")
	 	@video_id = response.parsed_response["feed"]["entry"].first["id"]['$t'].split(":").last
	 	@video_url = "https://www.youtube.com/embed/" + @video_id+"?autoplay=1"
	 # 	p @video_url

		# respond_to do |format|
  #        format.json {render json: @video_url}
  #   end
 render json: {video_url: @video_url}
# render json: {hi: 'stuff'}.to_json
	end


end
