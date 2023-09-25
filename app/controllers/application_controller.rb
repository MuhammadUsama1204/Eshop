class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  protected

  def  after_sign_in_path_for(resource)
    products_path
  end

end
