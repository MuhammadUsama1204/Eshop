FactoryBot.define do
  factory :product do
    title { 'Sample Product' }
    description { 'Sample product description' }
    price { 10.99 }
    total_quantity { 100 }
    quantity_in_stock { 100 }
  end
end
