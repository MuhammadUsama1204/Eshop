require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:product) { create(:product) }

  context 'Index' do
    it 'returns true' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns products' do
      get :index
      expect(assigns(:products)).to eq([product])
    end
  end
end
