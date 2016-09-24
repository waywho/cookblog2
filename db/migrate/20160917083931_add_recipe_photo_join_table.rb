class AddRecipePhotoJoinTable < ActiveRecord::Migration
  def change
  	create_table 'photos_recipes', id: false do |t|
  		t.belongs_to :recipe, index: true
  		t.belongs_to :photo, index: true
  	end
  end
end
