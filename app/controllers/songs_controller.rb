class SongsController < ApplicationController

	def index
	end

	def search
		artists = Playlist.find_artists(params)
    p artists
		songs = Playlist.get_artist_songs(artists)
		@playlist = Playlist.get_song_ids(songs)
    p @playlist
 		render json: {playlist: @playlist}
	end
end
