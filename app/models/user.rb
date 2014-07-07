class Artist

  def self.find_artists
    Echowrap.artist_search(:artist_start_year_after => params[:time], :artist_location => params[:location], :results => 10, :bucket => ["artist_location", "songs"])
  end

end
