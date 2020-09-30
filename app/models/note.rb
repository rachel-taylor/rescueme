class Note < ActiveRecord::Base
    scope :for_user, ->(user) {where(user:user)}
    belongs_to :user 
    has_many :comments, dependent: :destroy
    validates :title, presence: true
    validates :description, presence: true, length: {minimum: 20, maximum: 500}
    accepts_nested_attributes_for :comments 
    #validates :user_id, presence: true 
end 