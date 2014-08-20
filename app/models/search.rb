def pages
	@pages ||= find_pages
end	

def self.search(search)
	if search
		find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	else
		find(:all)
	end	
end	

private

	def find_pages
		Page.find(:all, :conditions => conditions)
	end	

	def name_conditions
		["pages.name LIKE ?", "%#{name}%"] unless name.blank?
	end	

	def status_conditions
		["pages.status LIKE ?", "%#{status}%"] unless status.blank?
	end	

	def conditions
		[conditions_clauses.join(' AND '), *conditions_options]
	end	

	def conditions_options
  		conditions_parts.map { |condition| condition[1..-1] }.flatten
	end

	def conditions_parts
  		private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
	end

