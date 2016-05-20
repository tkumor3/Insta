class InstagramFollow
  def self.build
    new
  end

  def call(user, client, id)
    client.follow_user(id)
    user.insta_user.follow(InstaUser.find_by(ins_id: id))
  end
end
