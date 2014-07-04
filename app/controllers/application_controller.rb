class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    # RSpotify::Track.search('Lotta that').first
  end

  def search
    # @track = RSpotify::Track.search(params[:track]).first
    # p @track.album.popularity
 @test = Echowrap.artist_search(:artist_location => "New York")



    # @test = Echowrap.artist_search(:name => "lil wayne")
    p @test.first.songs
    @bio = Echowrap.artist_biographies(:id => @test.first.id)
    @test.first.location
    render :index
  end
end
