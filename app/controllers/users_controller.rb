class UsersController < ApplicationController
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
        params.require(:user).permit(:username, :email, )
    end 
end 