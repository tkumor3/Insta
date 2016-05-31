class InstaTagsController < ApplicationController

	def user_tags
		id = params[:id]
		ins = InstaUser.find(id)
		client = Instagram.client(access_token:
																	 current_user.inst_token.access_token)
		MediaCounter.update(client)
		media = client.user_recent_media(ins.ins_id)
		TakeTagFromPhotos.new.call(media,ins)
		ValuablePhoto.call(media,30,ins)
		@tags = InstTag.joins(:tag_relations).where("tag_relations.insta_user_id= #{id}"
		).order("tag_relations.counter desc").limit(20)
	end

	def apriori
		@list = DateToMachineLerning.convert
		@res = MachineLearning.apriori(@list,10,20)
	end

end
