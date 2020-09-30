class UserController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user!

    def new 
        @user = User.new
    end 

    def create
        @User = User.new
        @user.save
    end 

    def show
        @notes = current_user.posts.order("created_at DESC")
    end 

    def edit
    end 

    def logged_in_user 
   
    end 
end 