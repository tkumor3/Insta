class WasRelation < ActiveRecord::Base
  belongs_to :follower, class_name: 'InstaUser'
  belongs_to :followed, class_name: 'InstaUser'
  validates :followed_id, presence: true
  validates :follower_id, presence: true
end
