class Profile < ActiveRecord::Base
	belongs_to :user, class_name: "User", foreign_key: "user_id"
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
