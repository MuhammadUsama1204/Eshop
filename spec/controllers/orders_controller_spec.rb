require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  
  let(:user) { FactoryBot.create(:user, confirmed_at: Time.now, roles: [create(:role, role: 'Customer')]) }

  before do
    sign_in user
  end

  context 'with valid attributes' do
    it 'creates a new order' do
      cart = create(:cart,user: user)
      expect do
        post :create, params: { order: attributes_for(:order, cart_id: cart.id, user_id: user.id) }
      end.to change(Order, :count).by(1)
    end
  end

end
