class User < ApplicationRecord
  has_many :notes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # devise :omniauthable, omniauth_providers: %i[twitter]
  #@user = User.from_omniauth(request.env["omniauth.auth"])

  
end
