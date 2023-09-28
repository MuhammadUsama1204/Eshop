class AddForeignKeyToUsersRoles < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :users_roles, :users, column: :user_id, on_delete: :cascade
  end
end
