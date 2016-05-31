class TagRelation < ActiveRecord::Base
  belongs_to :insta_user
  belongs_to :inst_tag
  has_one :inst_tag
end
