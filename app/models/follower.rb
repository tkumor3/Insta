class Follower < ActiveRecord::Base

    validates_uniqueness_of :user_id, :scope => :ins_id


    def self.add(insta, user_id, watch)

        if back = Follower.find_by(user_id: user_id, ins_id:insta.id, is_follow: false )
            back.update_attributes!(is_follow: true)
        end

        if foll = Follower.new(user_id: user_id)
            foll.username = insta.username
            foll.ins_id = insta.id
            foll.toFollows = watch
            foll.save
        end
    end

    def i_want_follow
        self.update_attributes!(toFollows: true)
    end

    def follower_to_delete
        self.update_attributes!(toFollows: false)
    end

    def stop_follow
        self.update_attributes!(is_follow: false)
    end

end
