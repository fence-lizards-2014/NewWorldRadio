class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def index
    # RSpotify::Track.search('Lotta that').first
  end

  def search
    # @track = RSpotify::Track.search(params[:track]).first
    # p @track.album.popularity
 @test = Echowrap.artist_search(:name => params[:track], :bucket => ['hotttnesss', 'familiarity', 'artist_location', 'songs'], :results => 1)
  @title =  @test.first.songs.first.title
  @track = RSpotify::Track.search(@title).first

    @test = Echowrap.artist_search(:artist_location => "New York", :artist_start_year_after => "1960", :bucket => ['artist_location', 'hotttnesss', "years_active"] )
    p @test
    @bio = Echowrap.artist_biographies(:id => @test.first.id)
    @test.first.location
    render :index
  end



  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
