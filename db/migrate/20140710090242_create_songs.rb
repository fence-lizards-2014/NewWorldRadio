class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :url_id
      t.references :station

      t.timestamps
    end
    add_index :songs, :station_id
  end
end
