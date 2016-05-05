class Followed < ActiveRecord::Base
    validates_uniqueness_of :user_id, :scope => :ins_id
    belongs_to :user

    def self.add(insta, user_id)
        unless back = Followed.find_by(user_id: user_id, ins_id: insta.id)
                foll = Followed.new(user_id: user_id)
                foll.username = insta.username
                foll.ins_id = insta.id
                foll.save
        else
            back.update_attributes!(is_follow: true)
        end
    end
end
