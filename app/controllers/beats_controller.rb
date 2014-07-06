class BeatsController < ApplicationController

	def index
		
	end

	def search
		puts "In beats"
		# p params
		# p params["track"]
		@artist = Echowrap.artist_search(:artist_start_year_after => params[:time], :artist_location => params[:location], :bucket => ["artist_location", "songs"])
		p @artist


		# @song =  Echowrap.song_search(:artist => params[:track], :results => 3)
		@title = @artist.sample.songs.sample.title
		@title = @title.split(" ").join("+")
		p @title
		response = HTTParty.get("https://partner.api.beatsmusic.com/v1/api/search?type=track&q=#{@title}&client_id=yupuktqwpjsbdka36drye9fv")
		data = JSON.parse(response.body)
		@song_id = data["data"].first["id"]
		puts @song_id
		redirect_to root_path
	end


end























