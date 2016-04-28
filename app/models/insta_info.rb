require 'instagram'

class InstaInfo

    def initialize client
        @fow = client.user_follows(client.user.id)
        @foed = client.user_followed_by(client.user.id)

    end

    def update_info user
        fow_current =[]
        follActive = user.followers.to_a
        @fow.each {|val| fow_current << val.id }
        follActive.each {|elem| user.follower.find(elem.id).update_attribute(:is_follow,
                                                                        false) unless fow_current.include? elem.ins_id}
        @fow.each {|foll| Follower.add(foll,user.id,false)}

        foed_current =[]
        @foed.each {|val| foed_current << val.id }
        @foed.each {|foed| Followed.add(foed,user.id)}
        foedActive = user.followeds.to_a
        foedActive.each {|elem| user.followed.find(elem.id).update_attribute(:is_follow,
                                                                        false) unless foed_current.include? elem.ins_id}

    end

    def not_follow_back user
        id_ed = []
        ufoed = user.followeds.where(isFollow: true).to_a
        ufoed.each {|id| id_ed << id.ins_id }
        ufow = user.followers.where(is_follow: true).where.not(ins_id: id_ed).where.not(toFollow: true)
        ufow
    end
end