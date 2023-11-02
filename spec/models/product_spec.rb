require 'rails_helper'

RSpec.describe Product, type: :model do

  context 'Model product test' do
    it "is valid with valid attributes" do
      product = Product.new(attributes_for(:product))
      expect(product).to be_valid
    end

    it "is not valid with invalid attribute title" do
      product = Product.new(attributes_for(:product, title: ''))
      expect(product).to_not be_valid
    end

    it "is not valid with invalid attribute price" do
      product = Product.new(attributes_for(:product, price: 'abc'))
      expect(product).to_not be_valid
    end

    it "is not valid with invalid attribute description" do
      product = Product.new(attributes_for(:product, description: ''))
      expect(product).to_not be_valid
    end

    it "is not valid with invalid attribute quantity_in_stock" do
      product = Product.new(attributes_for(:product, quantity_in_stock: ''))
      expect(product).to_not be_valid
    end
  end

end
