class CommentsController < ApplicationController 
    def index
        @comment = Comment.all
        #modview of all comments made
    end 

    def new 
        @comment = Comment.new
    end 

    def create
        @comment = Comment.new(comment_params)
        @comment.user = current_user
        #byebug
        if @comment.save
            redirect_to '/comments'
        else 
            render 'new'
        end 
    end 

    def show  
        # byebug
        @comment = Comment.find_by(id: params[:id])
    end 

    def edit 
        @comment = Comment.find_by([params[:id]])
        # byebug
        unless current_user.id == @comment.user_id
            flash[:notice] = "This is not your comment to edit!"
            redirect_to '/comments'
            return
        end 
    end 

    def update 
        @comment = Comment.find_by([params[:id]])
        if @comment.update(comment_params)
            redirect_to '/comments'
        else 
            redirect_to '/comments/edit/'
        end 
    end 

    def destroy 
        @comment = Comment.find_by([params[:id]])
        unless current_user.id == @comment.user_id
            flash[:notice] = "This is not your comment to delete!"
            redirect_to '/comments'
            return
        end 
        @comment.destroy 
        redirect_to '/comments'
    end 

    private 

    def comment_params
        # params.require(:user)
        params.require(:comment).permit(:title, :description)
        #userid params to link only to users comments 
    end 

end 