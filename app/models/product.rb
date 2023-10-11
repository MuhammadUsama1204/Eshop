class Product < ApplicationRecord
  PER_PAGE = 10;

  has_many :line_items, dependent: :destroy
  has_many :carts, through: :line_items

  has_one_attached :display_picture

  validates :title, :price, :description, :display_picture, :quantity_in_stock, presence: true
  validates :quantity_in_stock, numericality: { greater_than: 0, message: "must be at least one"}, on: [:create, :update]
  validates :price, numericality: { greater_than_or_equal_to: 0, message: "must be at least 0"}, on: [:create, :update]

  def self.searchFilter(products, params)
    products = products.where("title ILIKE ?", "%#{params[:search]}%") if params[:search].present?
    products = products.where("price >= ?", params[:min_price]) if params[:min_price].present?
    products = products.where("price <= ?", params[:max_price]) if params[:max_price].present?
    products
  end
end
