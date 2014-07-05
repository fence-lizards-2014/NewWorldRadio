class Artist < ActiveRecord::Base
  belongs_to :location
  has_many :albums
  has_many :tracks
end
