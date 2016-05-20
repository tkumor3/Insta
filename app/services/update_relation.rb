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
    @update_followers.call(client, user)
    @update_followed_by.call(client, user)
  end
end
