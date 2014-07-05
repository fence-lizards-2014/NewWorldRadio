class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.belongs_to :location

      t.timestamps
    end
  end
end
