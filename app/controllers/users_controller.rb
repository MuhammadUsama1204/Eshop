class UsersController < ApplicationController
  include PaginationCollectionHelper

  before_action :find_user, only: %i[show edit update destroy]
  before_action :authorize_user, only: %i[destroy edit update]

  def index
    @users = pagination_collection(User.all, :page, User::PER_PAGE)
  end

  def new
    @users = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Successfully Added"
      redirect_to root_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = "Successfully Updated"
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to root_path, notice: "User was successfully destroyed."
    else
      redirect_to root_path, alert: "Unable to destroy user."
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :email, role_ids: [])
  end

  def authorize_user
    flash[:alert] = "You are not Admin to perform this action!" if current_user.is_staff? && !current_user.is_admin?
    flash[:alert] = "You are not Staff or Admin to perform this action!" if current_user.is_customer? && !current_user.is_staff? && !current_user.is_admin?
    redirect_to users_path if !current_user.is_admin?
  end

  def find_user
    @user = User.find(params[:id])
  end

end
