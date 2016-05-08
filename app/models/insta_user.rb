class InstaUser < ActiveRecord::Base
    validates :username, uniqueness: true
    validates :username, :ins_id, presence: true

    belongs_to :user

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
        was_active_relationships.find_by(followed_id:
                                             insta_user.id).destroy if was_followering.include?(insta_user)
        active_relationships.create(followed_id: insta_user.id)
    end

    def unfollow(insta_user)
        active_relationships.find_by(followed_id: insta_user.id).destroy
        was_active_relationships.create(followed_id: insta_user.id)
    end


    def followering?(insta_user)
        followering.include?(insta_user)
    end

    def update_relation client
        fow = client.user_follows(client.user.id)
        foed = client.user_followed_by(client.user.id)
        fow.each {|inst_user| InstaUser.add(inst_user)}
        foed.each {|inst_user| InstaUser.add(inst_user)}

        id_ed = []
        foed.each {|id| id_ed << id.id }
        followed = InstaUser.where(ins_id: id_ed).to_a
        db_followed = self.followers.to_a
        (followed - db_followed).each {|user| user.follow(self)}
        (db_followed - followed).each {|user| user.unfollow(self)}

        id_w = []
        fow.each {|id| id_w << id.id }
        follower = InstaUser.where(ins_id: id_w).to_a
        db_follower = self.followering.to_a
        (follower- db_follower).each {|user| self.follow(user)}
        (db_follower - follower).each {|user| self.unfollow(user)}

    end

    def self.add(inst_user)
        if InstaUser.find_by(username: inst_user.username).nil?
            InstaUser.create(ins_id: inst_user.id,
                                    username: inst_user.username)
        end
    end


end
