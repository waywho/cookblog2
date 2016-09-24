class RemoveKeywordsFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :keywords, :string
  end
end
