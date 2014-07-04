class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    p RSpotify::Track.search('Gimme Shelter').first
  end
end
