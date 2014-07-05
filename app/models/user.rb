class User < ActiveRecord::Base
  attr_accessible :access_token, :email, :name, :password


  def self.from_omniauth(auth_hash)
	puts "USERRRRR"
     create! do |user|  
      user.provider = auth_hash.provider
      user.uid = auth_hash.uid
      user.name = auth_hash.info.name
      # user.oauth_token = auth_hash.credentials.token
      # user.oauth_expires_at = Time.at(auth_hash.credentials.expires_at)
      user.save!
    end
 end
end
