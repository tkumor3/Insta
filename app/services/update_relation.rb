# dowloand user information from Insta
class UpdateRelation
  def self.build
    new(UpdateFollowedBy.build, UpdateFollowers.build)
  end

  def initialize(update_followed_by, update_followers)
    @update_followed_by = update_followed_by
    @update_followers = update_followers
  end

  def call(client, user)
    followers = client.user_follows(client.user.id)
    followe_by  = client.user_followed_by(client.user.id)
    @update_followers.call(followers, user)
    @update_followed_by.call(followe_by, user)
  end
end
