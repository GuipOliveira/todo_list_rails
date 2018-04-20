class CollectionsController < ApplicationController

	def index
		@collections = Collection.where(user_id: current_user.id)
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
		@collection = Collection.new(name: name, is_public: is_public, tasks: tasks, user: current_user)
		if @collection.save
			redirect_to @collection
		else
			render :new
		end
	end

	def destroy
		collection = Collection.find(params[:id])
		collection.destroy
		redirect_to action: "index"
	end


	def edit
		@collection = Collection.find(params[:id])
	end

	def update
	end


	def destroy_task
		task = Task.find(params[:id])
		@collection = task.collection
		task.destroy			
		redirect_to @collection
	end

end