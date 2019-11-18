class CreateFlats < ActiveRecord::Migration[5.2]
  def change
    create_table :flats do |t|
      t.string :name
      t.integer :price_per_night
      t.integer :capacity
      t.string :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
