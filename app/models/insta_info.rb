class InstaInfo


    def self.not_follow_back(client)
        fow = client.user_follows(client.user.id)
        foed = client.user_followed_by(client.user.id)
        fow.each {|elem| fow.delete(elem) if foed.include? elem }
        fow
    end
end