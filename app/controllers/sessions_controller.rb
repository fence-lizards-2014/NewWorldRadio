class SessionsController < ApplicationController



  def create

    # User.from_omniauth(1)

  user = User.from_omniauth(env["omniauth.auth"])
  session[:user_id] = user.id
  # session[:user_id] = user.id
    redirect_to root_url
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
    redirect_to root_url
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end