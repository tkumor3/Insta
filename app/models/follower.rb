class Follower < ActiveRecord::Base

    validates_uniqueness_of :user_id, :scope => :ins_id


    def self.add(insta, user_id, watch)
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
        update_attributes!(toFollows: false)
    end

end
