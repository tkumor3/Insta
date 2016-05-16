class InstagramUnFollow
    def self.build
        new
    end

    def call(user,client, id)
        client.unfollow_user(id)
        user.insta_user.unfollow(InstaUser.find_by(ins_id: id))
    end
end