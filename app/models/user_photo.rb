class UserPhoto < ActiveRecord::Base
	has_one :user_photo_relation
	has_one :insta_user, through: :user_photo_relations
	has_many :photo_tags
	has_many :inst_tags, through: :photo_tags
end
