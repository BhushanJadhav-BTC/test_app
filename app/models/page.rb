class Page < ActiveRecord::Base
	belongs_to :client
	validates :client_id, presence: true
	validates :name, presence: true, length: {maximum: 50}
	validates :description, presence: true
	validates :billing, presence: true

	def self.search(search)

		if search
			find(:all, :conditions => ['name LIKE?', "%#{search}%"])
		else
			#@page=Page.paginate(:page => params[:page], :per_page => 2).order("deadline ASC").all
			find(:all)
		end	
	end	
end
