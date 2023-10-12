class Cart < ApplicationRecord
  belongs_to :user
  
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items
  
  has_one :order

  scope :active, -> { where(deleted: false) }

  def soft_delete
    update(deleted: true)
  end
end
