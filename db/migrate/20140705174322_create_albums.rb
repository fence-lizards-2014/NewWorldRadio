class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.integer :year
      t.belongs_to :artist

      t.timestamps
    end
  end
end
