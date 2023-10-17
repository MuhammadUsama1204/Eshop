FactoryBot.define do
  factory :order do
    payment_method { "Credit Card" }
    billing_address { "demo bill" }
    shipping_address { "demo ship" }
    status { "confirmed" }
    name { "usama" }
    contact_no { "1234567890" }
  end
end