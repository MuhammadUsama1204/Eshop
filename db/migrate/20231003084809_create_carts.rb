class CreateCarts < ActiveRecord::Migration[7.0]
  def self.up
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
  end
    def self.down
      remove_foreign_key :carts, :users
      drop_table :carts
    end
  end
end
