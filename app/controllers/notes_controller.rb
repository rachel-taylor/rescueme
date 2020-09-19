class NotesController < ApplicationController

    def index
        @note = Note.all
        #modview of all notes made
    end 

    def new 
        @note = Note.new
    end 

    def create
        @note = Note.new(note_params)
        @note.user = current_user
        #byebug
        if @note.save
            redirect_to '/notes'
        else 
            render 'new'
        end 
    end 

    def show  
        # byebug
        @note = Note.find_by(id: params[:id])
        @comment = Comment.new
        @comment.note_id = @note.id
    end 

    def edit 
        @note = Note.find_by([params[:id]])
        # byebug
        unless current_user.id == @note.user_id
            flash[:notice] = "This is not your note to edit!"
            redirect_to '/notes'
            return
        end 
    end 

    def update 
        @note = Note.find_by([params[:id]])
        if @note.update(note_params)
            redirect_to '/notes'
        else 
            redirect_to '/notes/edit/'
        end 
    end 

    def destroy 
        @note = Note.find_by([params[:id]])
        unless current_user.id == @note.user_id
            flash[:notice] = "This is not your note to delete!"
            redirect_to '/notes'
            return
        end 
        @note.destroy 
        redirect_to '/notes'
    end 

    private 

    def note_params
        # params.require(:user)
        params.require(:note).permit(:title, :description, :comment)
        #userid params to link only to users notes 
    end 

    def user_owns_note
        @note.user == current_user
    end 
end 