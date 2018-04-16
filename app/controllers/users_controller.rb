class UsersController < ApplicationController
    before_filter :must_be_admin
    
    def must_be_admin
        unless current_user && current_user.admin > 0
            redirect_to root_path, notice: "Access denied."
        end
    end
    
    def admin
        @users = User.where(:admin => 0).order(email: :ASC)
        @admins = User.where(:admin => 1).order(email: :ASC)
        @ultra_admins = User.where(:admin => 2).order(email: :ASC)
    end
    
    def make_admin
        @user = User.find(params[:id])
        @user.admin = '1'
        @user.save
        flash[:success] = "#{@user.first_name} is now an Admin"
        redirect_to users_admin_path
    end

    def remove_admin
        @user = User.find(params[:id])
        @user.admin = '0'
        @user.save
        flash[:success] = "#{@user.first_name} is no longer an Admin"
        redirect_to users_admin_path
    end    
end
