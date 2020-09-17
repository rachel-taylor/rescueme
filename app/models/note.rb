class Note < ActiveRecord::Base
    belongs_to :user
    has_many :comments, dependent: :destroy 
    validates :title, presence: true
    validates :description, presence: true, length: {minimum: 20, maximum: 500}
    #validates :user_id, presence: true 
end 