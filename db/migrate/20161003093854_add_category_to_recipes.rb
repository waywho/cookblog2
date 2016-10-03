class AddCategoryToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :category, :string
    add_index :recipes, :category
  end
end
