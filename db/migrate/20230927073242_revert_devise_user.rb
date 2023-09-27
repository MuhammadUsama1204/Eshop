class RevertDeviseUser < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :users_roles, :users

    remove_index :users, :email,                unique: true
    remove_index :users, :reset_password_token, unique: true

    remove_column :users, :encrypted_password, :string, null: false, default: ""
    remove_column :users, :reset_password_token, :string
    remove_column :users, :reset_password_sent_at, :datetime
    remove_column :users, :remember_created_at, :datetime

    remove_column :users, :username, :string
    remove_column :users, :email, :string, null: false, default: ""

    remove_column :users, :created_at, :datetime
    remove_column :users, :updated_at, :datetime
    remove_column :users, :confirmation_token, :string
    remove_column :users, :confirmed_at, :datetime
    remove_column :users, :confirmation_sent_at, :datetime
    remove_column :users, :unconfirmed_email, :string

    drop_table :users
  end
end
