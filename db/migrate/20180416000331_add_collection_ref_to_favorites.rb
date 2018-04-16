class AddCollectionRefToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_reference :favorites, :collection, foreign_key: true
  end
end
