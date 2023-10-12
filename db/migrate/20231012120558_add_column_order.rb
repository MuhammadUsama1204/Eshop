class AddColumnOrder < ActiveRecord::Migration[7.0]
  def self.up
    add_column :orders, :contact_no, :string
    add_column :orders, :name, :string
  end
  def self.down
    remove_column :orders, :contact_no
    remove_column :orders, :name
  end
end
