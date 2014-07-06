class SessionsController < ApplicationController

def create

puts "BEfore"
puts auth_hash.credentials.token
puts auth_hash.uid
puts "After"
redirect_to root_path

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
