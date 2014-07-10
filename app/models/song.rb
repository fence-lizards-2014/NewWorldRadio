class Song < ActiveRecord::Base
  attr_accessible :title, :url_id
  belongs_to :artist
end
