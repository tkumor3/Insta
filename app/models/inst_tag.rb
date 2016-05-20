class InstTag < ActiveRecord::Base
  require 'instagram'

  has_many :tag_relations
  has_many :insta_users, through: :tag_relations

  def self.addTag(user, tag)
    tag_n = InstTag.find_or_create_by(name: tag)
    tag_r = TagRelation.find_or_create_by(insta_user_id: user.id,
                                         inst_tag_id: tag_n.id)
    tag_r.increment(:counter, by = 1)
    tag_r.save
  end
end
