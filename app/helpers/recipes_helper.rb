module RecipesHelper

	def rand_recipe(recipes)
		offset_num = rand(recipes.count - 1)
		@rand_feature = recipes.offset(offset_num).first
	end
end
