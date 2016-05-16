class TakeTagFromPhotos

    def self.build
        new
    end

    def call(client, ins_user)

        media = client.user_recent_media(ins_user.ins_id)
        media.each do |media|
            media.tags.each {|tag| InstTag.addTag(ins_user, tag)} if media.created_time > ins_user.last_photo.to_s
        end
        ins_user.last_photo = media[0].created_time
        ins_user.save

    end
end