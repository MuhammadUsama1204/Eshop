class CreateOrders < ActiveRecord::Migration[7.0]
  def self.up
    create_table :orders do |t|
      t.string :order_number
      t.datetime :order_date
      t.decimal :total_price
      t.string :status
      t.text :address
      t.string :payment_method
      t.references :user, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
    def self.down
      remove_reference :orders, :user, foreign_key: true
      remove_reference :orders, :cart, foreign_key: true
      remove_column :orders, :order_number
      remove_column :orders, :order_date
      remove_column :orders, :total_price
      remove_column :orders, :status
      remove_column :orders, :address
      remove_column :orders, :payment_method
      drop_table :orders
    end 
  end
end
