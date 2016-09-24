class AddColumnToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :recipe_id, :integer
    add_index :photos, :recipe_id
  end
end
