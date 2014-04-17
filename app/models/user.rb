class User < ActiveRecord::Base
  has_many :fish
  has_one  :profile

	validates :username, presence: true
	validates :username, uniqueness: true
	validates :email, uniqueness: true, format: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
  
  
  has_secure_password
    

end