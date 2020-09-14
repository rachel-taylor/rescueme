class UsersController < ApplicationController
    protect_from_forgery 
    before_action :authenticate_user!
   
    def index
        @user = User.all
    end 

    def new 
        @user = User.new
    end 

    def create 
    end 

    def edit 
    end 

    def delete 
    end

private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end 
end 