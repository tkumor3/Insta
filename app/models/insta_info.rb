require 'instagram'

class InstaInfo

    def initialize client
        @fow = client.user_follows(client.user.id)
        @foed = client.user_followed_by(client.user.id)
    end

    def update_info user
        fow_current =[]
        follActive = user.followers.to_a
        @fow.each {|foll| Follower.add(foll,user.id,false)}
        @fow.each {|val| fow_current << val.id }
        follActive.each {|elem| user.followers.find(elem.id).stop_follow unless fow_current.include? elem.ins_id}

        foed_current =[]
        @foed.each {|val| foed_current << val.id }
        @foed.each {|foed| Followed.add(foed,user.id)}
        foedActive = user.followeds.to_a
        foedActive.each {|elem| user.followeds.find(elem.id).update_attribute(:is_follow,
                                                                        false) unless foed_current.include? elem.ins_id}
    end

    def not_follow_back user
        id_ed = []
        ufoed = user.followeds.where(is_follow: true).to_a
        ufoed.each {|id| id_ed << id.ins_id }
        user.followers.where(is_follow: true).where.not(ins_id: id_ed).where.not(toFollows: true)
    end

    def only_followed_by user
        id_ed = []
        ufoer = user.followers.where(is_follow: true).to_a
        ufoer.each {|id| id_ed << id.ins_id }
        user.followeds.where(is_follow: true).where.not(ins_id: id_ed)
    end
end