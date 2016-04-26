class InstaInfo


    def self.not_follow_back(client,id)
        fow = client.user_follows(client.user.id)
        fow.each {|foll| Follower.add(foll,id,false)}
        foed = client.user_followed_by(client.user.id)
        fow.each {|elem| fow.delete(elem) if foed.include? elem }
        fow.each {|elem| fow.delete(elem) if Follower.find_by(ins_id: elem.id, toFollows: true)}
        fow
    end
end