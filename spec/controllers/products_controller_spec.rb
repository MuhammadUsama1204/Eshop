require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  context 'Index' do
    it 'returns true' do
      get :index
      expect(response).to be_successful
    end
  end
end
