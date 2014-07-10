class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.integer :time
      t.string :location

      t.timestamps
    end
  end
end
