class CustomersController < ApplicationController
    def index
        @users = User.all
      end
    
      def show
        @user = User.find(params[:id])
      end
      def edit
        @user = User.find(params[:id])
      end

      def destroy
        @user = User.find(params[:id])
        if @user.destroy
          redirect_to root_path, notice: "User was successfully destroyed."
        else
          redirect_to root_path, alert: "Unable to destroy user."
        end
      end
      
end
