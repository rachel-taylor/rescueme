class NotesController < ApplicationController

    def index
        @note = Note.all
        #modview of all comments made
    end 

    def new 
        @note = Note.new
    end 

    def create
        @note = Note.new(note_params)
        @note.save
        redirect_to '/notes'
        
    end 

    def show  
        @note = Note.find_by([params[:id]])
        #byebug
        #redirect_to '/notes/index'
    end 

    def edit 
        @note = Note.find([params[:id]])
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
        #byebug
        @note = Note.find_by([params[:id]])
        @note.destroy
        redirect_to '/notes'
    end 

    private 

    def note_params
        params.require(:user_id)
        params.require(:note).permit(:title, :description, :id)
        #userid params to link only to users notes 
    end 
end 