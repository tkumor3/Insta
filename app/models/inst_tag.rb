class InstTag < ActiveRecord::Base
    require 'instagram'

    has_many :tag_relations
    has_many :insta_users , through: :tag_relations


    def self.addTag user,tag
        tagN = InstTag.find_or_create_by(name: tag)
        tagR = TagRelation.find_or_create_by(insta_user_id: user.id, inst_tag_id: tagN.id)
        tagR.increment(:counter, by = 1)
        tagR.save
    end

    def self.tag_from_photo(ins_user,client)

        media = client.user_recent_media(ins_user.ins_id)

        media.each do |media|
            media.tags.each {|tag| InstTag.addTag(ins_user, tag)} if media.created_time. > ins_user.last_photo.to_s
        end

        ins_user.last_photo = media[0].time
        ins_user.save

    end


end
