class SessionsController < ApplicationController



  def create

puts "BEfore"
puts auth_hash.credentials.token
puts auth_hash.uid
puts "After"


 # user = User.find_by_provider_and_uid(auth_hash.provider, auth_hash.uid) || User.from_omniauth(auth) 

   # session[:user_id] = user.id

  # session[]
  # session[:user_id] = user.id
  redirect_to "https://partner.api.beatsmusic.com/v1/api/tracks/tr51760467/audio?&access_token=xx6784be8gd6bmrcb896pyku&acquire=3"
  # # @username =  auth_hash.info.name
  # # @email = auth_hash.info.name

   
  #   # puts "BEFORE"
  #   # puts auth_hash
  #   # puts "AFTER"
  #   # sessions[:token] = auth_hash.token
  #   redirect_to user_path :id =>
  end

  def search
    
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