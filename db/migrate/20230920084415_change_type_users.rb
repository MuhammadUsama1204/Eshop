class ChangeTypeUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :username, :text
  end
end
