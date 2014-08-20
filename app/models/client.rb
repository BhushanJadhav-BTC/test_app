class Client < ActiveRecord::Base
	has_many :pages, dependent: :destroy
	validates :name, presence: true, length: {maximum: 50}

end
