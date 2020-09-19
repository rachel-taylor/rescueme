class Comment < ApplicationRecord
    belongs_to :note
    belongs_to :user
    validates :description, presence: true, length: {minimum: 20, maximum: 500}
    # belongs_to :user, :through: => :note
end
