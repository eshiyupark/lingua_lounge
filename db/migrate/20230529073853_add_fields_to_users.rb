class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :licence_number, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :phone_number, :string
  end
end
