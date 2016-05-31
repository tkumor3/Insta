# take tag from users photo
class TakeTagFromPhotos
  def self.build
    new
  end

  def call(medias, ins_user)
    medias.each do |media|
      media.tags.each do |tag|
        InstTag.addTag(ins_user, tag) if media.created_time > ins_user.last_photo.to_s
      end
    end
    unless medias.empty?
      ins_user.last_photo = medias[0].created_time
      ins_user.save
    end
  end
end
