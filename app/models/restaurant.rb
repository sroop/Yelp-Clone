class Restaurant < ActiveRecord::Base

	validates :name, presence: true, uniqueness: true
	validates :cuisine, presence: true

	has_many :reviews

end
