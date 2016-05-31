class UpdateRelation
  class UpdateFollowers
    def self.build
      new(FromInstToActiveRecord.build)
    end

    def initialize(data)
      @data = data
    end

    def call(ins_data, current_user)
      follower = @data.call(ins_data)
     db_follower = current_user.followering.to_a
     (follower - db_follower).each { |user| current_user.follow(user) }
     (db_follower - follower).each { |user| current_user.unfollow(user) }
   end
  end
end