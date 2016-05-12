class UpdateRelation
    class UpdateFollowers

        def self.build
            new
        end

        def call(client, current_user)

            fow = client.user_follows(client.user.id)
            fow.each {|inst_user| InstaUser.add(inst_user)}
            id_w = []
            fow.each {|id| id_w << id.id }
            follower = InstaUser.where(ins_id: id_w).to_a
            db_follower = current_user.followering.to_a
            (follower- db_follower).each {|user| current_user.follow(user)}
            (db_follower - follower).each {|user| current_user.unfollow(user)}

        end
    end
end