require 'instagram'

class InstaInfo

    def initialize client
        @fow = client.user_follows(client.user.id)
        @foed = client.user_followed_by(client.user.id)

    end


    def not_follow_back id
        fow_current =[]
        follActive =Follower.all.to_a
        @fow.each {|val| fow_current << val.id }
        follActive.each {|elem| Follower.find(elem.id).update_attribute(:is_follow, false) unless fow_current.include? elem.ins_id}
        @fow.each {|foll| Follower.add(foll,id,false)}
        @fow.delete_if {|elem| @foed.include? elem }
        @fow.delete_if {|elem|  Follower.find_by(ins_id: elem.id, toFollows: true)}

        @fow.each {|val| fow_current << val.id }
        @fow
    end

    def you_dont_follow

    end
end