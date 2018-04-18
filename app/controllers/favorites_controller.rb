class FavoritesController < ApplicationController

    def index
        @collections = current_user.favorites.map{|f| Collection.find f.collection_id} 
    end

    def create
        collection = Collection.find(params[:id])
        favorite = Favorite.new(user_id: current_user.id, collection_id: collection.id)
        favorite.save!
        redirect_to collection_url(collection)
    end

    def destroy
        collection = Collection.find(params[:id])
        favorite = collection.favorites.find_by(user_id: current_user.id)
        favorite.destroy
        redirect_to collection_url(collection)
    end


end