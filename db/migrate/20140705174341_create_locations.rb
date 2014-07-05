class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :region
      t.string :country
      t.string :city
      t.string :state, default: 'none'

      t.timestamps
    end
  end
end
