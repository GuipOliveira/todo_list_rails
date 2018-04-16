class CollectionsController < ApplicationController
	def index
		@collections = Collection.all
	end

	def new
		@collection = Collection.new 
	end

	def show
		@collection = Collection.find(params[:id])
	end

	def create
		name = params[:collection][:name]
		is_public = params[:collection][:is_public]
		tasks = params[:tasks]
		tasks = tasks.map{|task| Task.new name:task}
		@collection = Collection.new(name: name, is_public: is_public, tasks: tasks)
		if @collection.save
			redirect_to @collection
		else
			render :new
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

end