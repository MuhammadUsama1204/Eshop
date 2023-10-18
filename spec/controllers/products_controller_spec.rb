require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  let(:user) { FactoryBot.create(:user, confirmed_at: Time.now, roles: [create(:role, role: 'Customer')]) }
  let(:product) { FactoryBot.create(:product) }

  before do
    sign_in user
  end
  
  context 'Index' do
    it 'returns with a success status' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns products' do
      get :index
      expect(assigns(:products)).to eq([product])
    end
  end

  context 'Show' do
    it 'returns with a success status' do
      get :show, params: { id: product.id }
      expect(response).to be_successful
    end
  end
  
end
