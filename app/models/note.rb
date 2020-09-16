class Note < ActiveRecord::Base
    belongs_to :user
    validates :title, presence: true
    validates :description, presence: true, length: {minimum: 20, maximum: 500}
    #validates :user_id, presence: true 
end 