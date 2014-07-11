class Station < ActiveRecord::Base
  attr_accessible :location, :name, :time
  has_many :songs
end
