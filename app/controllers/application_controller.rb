class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    RSpotify::Track.search('Lotta that').first
  end

  def search
    @track = RSpotify::Track.search(params[:track]).first
    render :index
  end
end
