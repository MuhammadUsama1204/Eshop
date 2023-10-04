class ApplicationController < ActionController::Base
  before_action :authenticate_user!
	before_action :set_user_cart_

  protected

  def after_sign_in_path_for(resource)
    products_path
  end
  
  private

	def set_user_cart_
    if current_user.cart
      @cart = current_user.cart
    else
      @cart = current_user.create_cart
    end
	end
end
