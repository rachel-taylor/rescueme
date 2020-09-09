class Note < ActiveRecord::Base
    validates :title, presence: true
    validates :description, presence: true, length: {minimum: 20}
end 