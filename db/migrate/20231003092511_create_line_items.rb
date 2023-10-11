class CreateLineItems < ActiveRecord::Migration[7.0]
  def self.up
    create_table :line_items do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :price

      t.timestamps
    end
    def self.down
      remove_foreign_key :line_items, :carts
      remove_foreign_key :line_items, :products
      drop_table :line_items
    end
  end
end
