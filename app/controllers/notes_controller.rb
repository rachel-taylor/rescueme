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
        #byebug
        redirect_to '/notes/index'
    end 

    def edit
        @note = Note.find([params:id])
    end 

    def update
        @note = Note.find([params:id])
        if @note.update(note.params)
            redirect_to '/notes/show'
        else 
            redirect_to 'notes/edit/'
        end 
    end 


    private 
    def note_params
        params.require(:note).permit(:title, :description)
    end 
end 