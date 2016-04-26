class Follower < ActiveRecord::Base


    def self.add(insta, user_id, watch)
        unless Follower.find_by(ins_id: insta.id,user_id: user_id)
            foll = Follower.new(user_id: user_id)
            foll.username = insta.username
            foll.ins_id = insta.id
            foll.toFollows = watch
            foll.save!
        end
    end

    def i_want_follow
        update_attribute(toFollows, true)
    end

    def follower_to_delete
        update_attribute(toFollows, false)
    end

end
