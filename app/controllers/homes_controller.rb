class HomesController < ApplicationController
	def index
		@collections = Collection.where(is_public: true)
	end
end