class UsersController < ApplicationController
    before_action :authorize_admin, only: :create
    before_action :authorize_staff, only: :create
    before_action :authorize_customer, only: [:destroy, :edit, :update]
    def index
        @users = User.all
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
    def show
    @user = User.find(params[:id])
    end
    def edit
    @user = User.find(params[:id])
    end
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:success] = "Successfully Updated"
            redirect_to root_path           
        else
            render :edit
        end
    end
    def destroy
      
        @user = User.find(params[:id])
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
        def authorize_admin
            if user_has_role?('Admin')
                flash[:alert] = "You are not authorized to perform this action."
                redirect_to root_path
            end
        end
        def authorize_staff
            if user_has_role?('Staff')
                flash[:alert] = "You are not authorized to perform this action."
                redirect_to root_path
            end
        end
    
        def authorize_customer
            if user_has_role?('Customer')
                flash[:alert] = "You are not authorized to perform this action."
                redirect_to root_path
            end
        end

        def user_has_role?(role_name)
            role = Role.find_by(role: role_name)
            current_user&.users_roles.exists?(role_id: role.id)
        end
                
end
