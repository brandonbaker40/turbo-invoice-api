class RemoveFieldsAndForeignKeysFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :clearances, column: :user_id
    remove_foreign_key :rates, column: :user_id
    remove_foreign_key :visits, column: :user_id

    remove_column :clearances, :user_id
    remove_column :rates, :user_id
    remove_column :visits, :user_id

    remove_column :users, :provider, :string
    remove_column :users, :uid, :string
    remove_column :users, :encrypted_password, :string
    remove_column :users, :reset_password_token, :string
    remove_column :users, :reset_password_sent_at, :datetime
    remove_column :users, :allow_password_change, :boolean
    remove_column :users, :remember_created_at, :datetime
    remove_column :users, :sign_in_count, :integer
    remove_column :users, :current_sign_in_at, :datetime
    remove_column :users, :last_sign_in_at, :datetime
    remove_column :users, :current_sign_in_ip, :string
    remove_column :users, :last_sign_in_ip, :string
    remove_column :users, :confirmation_token, :string
    remove_column :users, :confirmed_at, :datetime
    remove_column :users, :confirmation_sent_at, :datetime
    remove_column :users, :unconfirmed_email, :string
    remove_column :users, :name, :string
    remove_column :users, :nickname, :string
    remove_column :users, :image, :string
    remove_column :users, :tokens, :json
    remove_column :users, :email, :string
  end
end
