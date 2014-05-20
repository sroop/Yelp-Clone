class Restaurant < ActiveRecord::Base

	validates :name, :cuisine, presence: true

end
