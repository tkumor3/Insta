class UpdateRelation
  class UpdateFollowedBy
    def self.build
      new(FromInstToActiveRecord.build)
    end

    def initialize(data)
      @data = data
    end

    def call(ins_data, current_user)
      followed = @data.call(ins_data)
      db_followed = current_user.followers.to_a
      (followed - db_followed).each { |user| user.follow(current_user) }
      (db_followed - followed).each { |user| user.unfollow(current_user) }
    end
  end
end
