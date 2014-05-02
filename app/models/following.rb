class Following < ActiveRecord::Base
	belongs_to :from_user, class_name: "User"
  belongs_to :to_user,   class_name: "User"

  validate :from_user_id, presence: true
  validate :to_user_id,   presence: true
end
