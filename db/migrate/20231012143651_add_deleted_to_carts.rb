class AddDeletedToCarts < ActiveRecord::Migration[7.0]
  def self.up
    add_column :carts, :deleted, :boolean, default: false
  end
  def self.down
    remove_column :carts, :deleted, :boolean, default: false
  end
end
