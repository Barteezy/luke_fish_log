class User < ActiveRecord::Base
  has_many :fish
  has_one  :profile

  has_many :followings_from_me,
    class_name: "Following", foreign_key: "from_user_id"
  has_many :followings_to_me,
    class_name: "Following", foreign_key: "to_user_id"

	validates :username, presence: true
	validates :username, uniqueness: true
	validates :email, uniqueness: true, format: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
  
  
  has_secure_password
    

end