module MediaCounter
	def self.update client
 		tags = InstTag.where(media_count: nil)
		tags.each do |tag|
			begin
			ins_tag = client.tag(tag.name)
			tag.update_attributes(media_count: ins_tag["media_count"])
			rescue
			end
		end

	end
end