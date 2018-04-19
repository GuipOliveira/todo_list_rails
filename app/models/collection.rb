class Collection < ApplicationRecord
	has_many :tasks
	has_many :favorites
	belongs_to :user	

end
