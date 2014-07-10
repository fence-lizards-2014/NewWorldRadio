class Artist < ActiveRecord::Base
  attr_accessible :name
  belongs_to :station
  has_many :songs
end
