class UserPhotoRelation < ActiveRecord::Base
	belongs_to :insta_user
	belongs_to :user_photo
end
