class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.string :name
      t.boolean :is_public

      t.timestamps
    end
  end
end
