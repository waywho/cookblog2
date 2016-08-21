class Step < ActiveRecord::Base
	belongs_to :recipe

	include RankedModel
  	ranks :row_order, :with_same => :recipe_id
end
