class Station < ActiveRecord::Base
  attr_accessible :location, :name, :time
  has_many :artists
  has_many :songs, :through => :artists
end
