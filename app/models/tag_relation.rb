class TagRelation < ActiveRecord::Base
    belongs_to :insta_user
    belongs_to :inst_tag

    def inc
        self.counter += 1
    end


end
