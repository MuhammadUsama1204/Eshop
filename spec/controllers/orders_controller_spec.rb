require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  context 'with valid attributes' do
    it 'creates a new order' do
      user = create(:user, roles: [create(:role, role: 'Customer')])
      cart = create(:cart)
      expect do
        post :create, params: { order: attributes_for(:order, cart_id: cart.id, user_id: user.id) }
      end.to change(Order, :count).by(1)
    end
  end
end
