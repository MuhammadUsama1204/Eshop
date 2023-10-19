class Order < ApplicationRecord
  PER_PAGE = 10;

  after_initialize :generate_order_number

  validates :contact_no, numericality: { only_integer: true }, length: { in: 11..14, message: "should be between 11 and 14 digits" }
  validates :shipping_address, presence: { message: "should be present" }
  validates :billing_address, presence: { message: "should be present" }
  validates :name, presence: { message: "should be present" }
  
  belongs_to :user
  belongs_to :cart
  
  attribute :order_date, default: -> { Time.current }
  attribute :status, default: "Confirmed"
  attribute :payment_method, default: "Credit Card"

  def generate_order_number
    while true
      self.order_number = "#{Time.current.strftime('%Y%m%d%H%M%S')}#{rand(1000..9999)}"
      break unless Order.exists?(order_number: self.order_number)
    end
  end    
end
