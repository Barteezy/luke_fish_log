class User < ActiveRecord::Base
  has_many :fish_pins
  has_one :profile

	validates :username, presence: true
	validates :username, uniqueness: true
	validates :email, uniqueness: true, format: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
  validates :password, length: { minimum: 4 }
  
  has_secure_password
    

end