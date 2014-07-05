class SessionsController < ApplicationController


def search
    # @track = RSpotify::Track.search(params[:track]).first
    # p @track.album.popularity
   p @song =  Echowrap.song_search(:artist => 'Macklemore', :results => 3)
   
   @title = @song.first.title

   response = HTTParty.get("https://partner.api.beatsmusic.com/v1/api/search?type=track&q=Church+scholars&client_id=yupuktqwpjsbdka36drye9fv")
   
puts "Response"
   data = JSON.parse(response.body)
   # puts data
   # p data.class
   @song_id = data["data"].first["id"]
   # p data["id"]
   # puts "responsebody"
   # p response


 # @test = Echowrap.artist_search(:name => params[:track], :bucket => ['hotttnesss', 'familiarity', 'artist_location', 'songs'], :results => 1)
  # @title =  @test.first.songs.first.title
  # @track = RSpotify::Track.search(@title).first

  #   @test = Echowrap.artist_search(:artist_location => "New York", :artist_start_year_after => "1960", :bucket => ['artist_location', 'hotttnesss', "years_active"] )
  #   p @test
  #   @bio = Echowrap.artist_biographies(:id => @test.first.id)
  #   @test.first.location
    render :index
  end

  def create

puts "BEfore"
puts auth_hash.credentials.token
puts auth_hash.uid
puts "After"
redirect_to root_path


 # user = User.find_by_provider_and_uid(auth_hash.provider, auth_hash.uid) || User.from_omniauth(auth) 

   # session[:user_id] = user.id

  # session[]
  # session[:user_id] = user.id
  # redirect_to "https://partner.api.beatsmusic.com/v1/api/tracks/tr51760467/audio?&access_token=xx6784be8gd6bmrcb896pyku&acquire=3"
  # # @username =  auth_hash.info.name
  # # @email = auth_hash.info.name

   
  #   # puts "BEFORE"
  #   # puts auth_hash
  #   # puts "AFTER"
  #   # sessions[:token] = auth_hash.token
  #   redirect_to user_path :id =>
  end


  def destroy
   
    session[:user_id] = nil
    session.clear
    redirect_to root_url
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end