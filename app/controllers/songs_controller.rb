class SongsController < ApplicationController

	def index
	end

	def search
		artists = Playlist.find_artists(params)
		songs = Playlist.get_artist_songs(artists)
		@playlist = Playlist.get_song_urls(songs)

 		render json: {playlist: @playlist}
	end
end
