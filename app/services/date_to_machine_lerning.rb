module DateToMachineLerning

	def self.convert
		photo_tags = []
		photos = UserPhoto.all
		photos.each do |p|
			tags = p.inst_tags
			photo_tags << tags.map { |tag| tag.name}
		end
		photo_tags
	end

end