module ValuablePhoto
	def self.call(medias, limit, ins_user)
		medias.each do |media|
		unless UserPhoto.find_by(url: media.url) and media.counter["likes"] < limit
			photo = UserPhoto.new
			photo.url = media.images.standard_resolution['url']
			photo.likes = media['likes']['count']
			if photo.save
				UserPhotoRelation.create(insta_user_id: ins_user.id, user_photo_id: photo.id)
p
				ValuablePhoto.add_tag(media.tags, photo.id)
			end
		end
		end
	end
	private
	def self.add_tag tags, photo_id
		tags.each do |tag|
			my_tag = InstTag.find_by(name: tag)
			PhotoTag.create(inst_tag_id: my_tag.id, user_photo_id: photo_id)
		end

	end
end