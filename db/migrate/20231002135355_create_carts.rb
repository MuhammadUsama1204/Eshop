class CreateCarts < ActiveRecord::Migration[7.0]
  def self.up
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.timestamps
    end
  end
  def self.down
    remove_reference :carts, :user, foreign_key: true
    remove_reference :carts, :product, foreign_key: true
  end
end
