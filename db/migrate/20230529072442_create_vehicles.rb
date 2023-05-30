class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.integer :number_of_passengers
      t.string :transmission
      t.float :price_per_day
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end
