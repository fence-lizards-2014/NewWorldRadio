class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.references :artist
      t.string :url_id

      t.timestamps
    end
    add_index :songs, :artist_id
  end
end
