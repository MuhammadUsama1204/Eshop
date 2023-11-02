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

    it 'will assigns products' do
      get :index
      expect(assigns(:products)).to eq([product])
    end
  end

  context 'New' do
    it 'return with a success status' do
      get :new
      expect(response).to be_successful
    end
  end

  context 'Create' do
    it 'create a new product with valid params' do
      expect do
        post :create, params: { product: attributes_for(:product) }
      end.to change(Product, :count).by(1)
      expect(response).to redirect_to(products_path)
    end

    it 'will not create product with invalid params' do
      post :create, params: {product: attributes_for(:product, title: nil) }
      expect(response).to render_template(:new)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end


  context 'Edit' do
    it 'get the product id and return success status' do
      get :edit, params: { id: product.id }
      expect(response).to be_successful
    end
  end

  context 'Update' do
    it 'will update the product price' do
      new_price = 100
      patch :update, params: { id: product.id, product: {price: new_price} } 
      expect(product.reload.price).to eq(new_price)
      expect(response).to redirect_to(products_path)
    end

    it 'will not update the product title due validation failure' do
      patch :update, params: { id: product.id, product: {title: ''} }
      expect(response).to render_template(:edit)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context 'Delete' do
    it 'will delete the product and return success status' do
      delete :destroy, params: { id: product.id }
      expect(flash[:notice]).to be_present
      expect(response). to redirect_to(products_path)
    end
  end

  context 'Show' do
    it 'returns with a success status' do
      get :show, params: { id: product.id }
      expect(response).to be_successful
    end
  end
  
end
