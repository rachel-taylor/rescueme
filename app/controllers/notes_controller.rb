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
        @note = Note.find
        #byebug
        #redirect_to '/notes/index'
    end 

    def edit #button not rendering 
        @note = Note.find
    end 

    def update #button not rendering
        @note = Note.find([params:id])
        if @note.update(note.params)
            redirect_to '/notes/show'
        else 
            redirect_to 'notes/edit/'
        end 
    end 

    def delete
        @note = Note.find(params[:id])
        @note.delete 
        redirect_to 'notes/show'
    end 

    private 

    def note_params
        params.require(:note).permit(:title, :description)
        #userid params to link only to users notes 
    end 
end 