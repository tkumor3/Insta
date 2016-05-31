module MachineLearning
	def self.apriori(data, support = 50,confidence = 50)
		reduced = data.map {|list| list.uniq }
		items = Hash.new(0)
		reduced.each do |list|
			list.each do |element|
				items[element] = items[element] + 1
			end
		end
		elements = reduced.flatten.uniq.sort
		rules = Hash.new([])
		elements.each do |condition|
			elements.each do |result|
				next if condition == result
				rule_power = reduced.collect{|list| list.include?(condition) and list.include?(result)}.count{|x| x}
				this_support = (100 * rule_power)/reduced.length
				this_confidence = (100 * rule_power)/items[condition]
				rules[condition] = rules[condition].dup.push(result) if this_support >= support and this_confidence >= confidence and not rules[condition].include?(result)
			end
		end
		rules
	end
end