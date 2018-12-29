class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :discipline, foreign_key: true
    add_column :users, :street_address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip_code, :string
  end
end
