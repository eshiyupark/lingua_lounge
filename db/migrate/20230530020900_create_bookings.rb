class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :date_from
      t.date :date_to
      t.string :confirmation_status
      t.string :completion_status
      t.string :comment
      t.references :user, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
