class Restaurant < ActiveRecord::Base

	validates :name, presence: true
	validates :cuisine, presence: true

end
