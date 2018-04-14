class AddCollectionRefToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :collection, foreign_key: true
  end
end
