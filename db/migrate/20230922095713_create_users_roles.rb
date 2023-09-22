class CreateUsersRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :users_roles do |t|
      t.references :role, null: false, foreign_key: { on_delete: :cascade }
      t.references :user, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
