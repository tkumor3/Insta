class InstTag < ActiveRecord::Base
    require 'instagram'

    has_many :tag_relations
    has_many :insta_users , through: :tag_relations


    def self.addTag(user,tag)
        tagN = InstTag.find_or_create_by(name: tag)
        tagR = TagRelation.find_or_create_by(insta_user_id: user.id, inst_tag_id: tagN.id)
        tagR.increment(:counter, by = 1)
        tagR.save
    end



end
