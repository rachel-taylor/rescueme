class CommentsController < ApplicationController 
    def index
        @comment = Comment.all
    end 

    def new 
        @comment = Comment.new
        @comment.note = Note.find_by(id: params[:note_id])
        @note = @comment.note
    end 

    def create
        @note = Note.find_by(params[:note])
        @comment = @note.comments.new(comment_params)
        @comment.user = current_user
        # @comment.valid? 
        if !@comment.valid?
            flash[:alert] = @comment.errors.details[:description].join ','
           render :new
           return   
        end 
    if @comment.save!
        # byebug
            flash[:success] = "Comment Posted!"
            # redirect_back(fallback_location: root_path)
           redirect_to "/notes/#{@note.id}"
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
        params.require(:comment).permit(:description, :note_id)
        #userid params to link only to users comments 
    end 

   
end 