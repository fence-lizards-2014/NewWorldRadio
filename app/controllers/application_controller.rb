class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    # RSpotify::Track.search('Lotta that').first
  end

  private

  def current_user
  puts current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


 end


