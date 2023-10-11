class AddColumnToOrder < ActiveRecord::Migration[7.0]
  def self.up
    add_column :orders, :billing_address, :text
    add_column :orders, :shipping_address, :text
    add_column :orders, :sub_total, :decimal
  end
  def self.down
    remove_column :orders, :billing_address
    remove_column :orders, :shipping_address
    remove_column :orders, :sub_total
  end
end
