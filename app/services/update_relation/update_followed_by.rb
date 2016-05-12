class UpdateRelation
    class UpdateFollowedBy

        def self.build
            new
        end

        def call(client,current_user)

            foed = client.user_followed_by(client.user.id)
            foed.each {|inst_user| InstaUser.add(inst_user)}
            id_ed = []
            foed.each {|id| id_ed << id.id }
            followed = InstaUser.where(ins_id: id_ed).to_a
            db_followed = current_user.followers.to_a
            (followed - db_followed).each {|user| user.follow(current_user)}
            (db_followed - followed).each {|user| user.unfollow(current_user)}

        end


    end
end