class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.string :time
      t.string :location

      t.timestamps
    end
  end
end
