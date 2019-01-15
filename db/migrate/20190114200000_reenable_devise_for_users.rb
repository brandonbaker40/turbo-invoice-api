# frozen_string_literal: true

class ReenableDeviseForUsers < ActiveRecord::Migration[5.2]
  # rubocop:disable Metrics/AbcSize
  def change
    ## Required
    add_column :users, :provider, :string, null: false, default: 'email'
    add_column :users, :uid, :string, null: false, default: ''

    ## Database authenticatable
    add_column :users, :encrypted_password, :string, null: false, default: ''

    ## Recoverable
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime
    add_column :users, :allow_password_change, :boolean, default: false

    ## Rememberable
    add_column :users, :remember_created_at, :datetime

    ## Trackable
    add_column :users, :sign_in_count, :integer, default: 0, null: false
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :current_sign_in_ip, :string
    add_column :users, :last_sign_in_ip, :string

    ## Confirmable
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string # Only if using reconfirmable


    ## Lockable
    # add_column :users, :failed_attempts, :integer, :default => 0, :null => false # Only if lock strategy is :failed_attempts
    # add_column :users, :unlock_token, :string # Only if unlock strategy is :email or :both
    # add_column :users, :locked_at, :datetime

    ## User Info
    # already exists on user model

    ## Tokens
    add_column :users, :tokens, :json

    add_column :users, :timestamps, :datetime

    add_index :users, %i[uid provider], unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,       unique: true
  end
end

# rubocop:enable Metrics/LineLength
