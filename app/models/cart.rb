class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items
  has_one :order

  # def add_product(product)
  #   existing_line_item = line_items.find_by(product: product)
  #   if existing_line_item
  #     existing_line_item.quantity += 1
  #     existing_line_item.save
  #   else
  #     new_line_item = line_items.build(product: product, quantity: 1, price: product.price)
  #     new_line_item.save
  #   end
  # end
end
