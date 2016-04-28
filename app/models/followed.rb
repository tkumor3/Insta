class Followed < ActiveRecord::Base

    validates_uniqueness_of :user_id, :scope => :ins_id

    def self.add(insta, user_id)

        unless back = Follower.find_by(user_id: user_id, ins_id: insta.id)
            if foll = Followed.new(user_id: user_id)
                foll.username = insta.username
                foll.ins_id = insta.id
                foll.save
            end
        else
            back.update_attributes!(is_follow: true)
        end
    end
end
