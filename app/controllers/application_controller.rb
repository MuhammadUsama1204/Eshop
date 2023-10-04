class ApplicationController < ActionController::Base
  before_action :authenticate_user!
	before_action :set_user_cart

  private

  def set_user_cart
    if user_signed_in?
      if current_user.cart
        @cart = current_user.cart
      else
        @cart = current_user.create_cart
      end
    else
      @cart = nil 
    end
  end

  protected

  def after_sign_in_path_for(resource)
    products_path
  end
end
