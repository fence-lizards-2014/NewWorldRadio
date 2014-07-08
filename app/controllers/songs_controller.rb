# CR is this a SongsController or a PlaylistController
class SongsController < ApplicationController

	def index
	end

	def search
    song_info = {}
    # CR what is song_info - you aren't using it
    # CR create a get_playlist method on your Playlist model that knows to call these three methods.
		artists = Playlist.find_artists(params)
		songs = Playlist.get_artist_songs(artists)
		@playlist = Playlist.get_song_ids(songs)
 	  render json: {playlist: @playlist}
	end
end
