class Song < ActiveRecord::Base
  belongs_to :station
  attr_accessible :title, :url_id
end
