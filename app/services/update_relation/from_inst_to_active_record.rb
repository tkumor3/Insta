class UpdateRelation
  class FromInstToActiveRecord
	  def self.build
		  new
	  end

	  def call(ins_data)
		  ins_data.each { |inst_user| InstaUser.add(inst_user) }
		  id_ed = []
		  ins_data.each { |id| id_ed << id.id }
	  	active_inst_user = InstaUser.where(ins_id: id_ed).to_a
	  	active_inst_user
	  end
	end
end