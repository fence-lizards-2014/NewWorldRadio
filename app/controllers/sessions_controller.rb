class SessionsController < ApplicationController

  def create
    credentials = request.env["omniauth.auth"].credentials
    p credentials
    oauth_token = credentials.secret + credentials.token
    p oauth_token
    # user = User.find_by_provider_and_uid(item["provider"], item["uid"]) || User.create(provider:item["provider" ], uid:item["uid"], name: item["name"])


    # session[:user_id] = user.id
    # redirect_to root_url, :notice => "Signed in!"

  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
