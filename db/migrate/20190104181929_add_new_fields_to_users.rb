class AddNewFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email, :string
    add_index :users, :email, unique: true
    add_column :users, :auth0_id_string, :string
    add_index :users, :auth0_id_string, unique: true
  end
end
