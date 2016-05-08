class InstaUser < ActiveRecord::Base
    #validates :username, uniqueness: true
    #validates :username, :ins_id, presence: true

    has_one :user

    has_many :active_relationships, class_name: "InstRelation",
             foreign_key: :follower_id,
             dependent: :destroy

    has_many :passive_relationships, class_name: "InstRelation",
             foreign_key: :followed_id,
             dependent: :destroy

    has_many :followering, through: :active_relationships, source: :followed
    has_many :followers, through: :passive_relationships, source: :follower


    has_many :was_active_relationships, class_name: "WasRelation",
             foreign_key: :follower_id,
             dependent: :destroy

    has_many :was_passive_relationships, class_name: "WasRelation",
             foreign_key: :followed_id,
             dependent: :destroy

    has_many :was_followering, through: :was_active_relationships, source: :followed
    has_many :was_followers, through: :was_passive_relationships, source: :follower


    def follow(insta_user)
        was_active_relationships.find_by(followed_id: insta_user.id).destroy if was_followering.include?(insta_user)
        active_relationships.create(followed_id: insta_user.id)
    end

    def unfollow(insta_user)
        active_relationships.find_by(followed_id: insta_user.id).destroy
        was_active_relationships.create(followed_id: insta_user.id)
    end


    def followering?(insta_user)
        followering.include?(insta_user)
    end


end
