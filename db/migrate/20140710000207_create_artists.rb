class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.references :station

      t.timestamps
    end
    add_index :artists, :station_id
  end
end
