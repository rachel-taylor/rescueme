class User < ActiveRecord::Base
    has_many :notes
    has_secure_password
    validates :username, presence: true, uniqueness: true, length: {minimum: 3, maximum: 15}
    validates :email, presence: true, uniqueness: true, length: {minimum: 3, maximum: 45}

end 