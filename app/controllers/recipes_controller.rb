class RecipesController < ApplicationController
	def index
		@tags = Recipe.published_now.tag_counts_on(:keyword)
		if params[:keyword]
			@recipes = Recipe.published_now.tagged_with(params[:keyword]).order(:title)
		else
			@recipes = Recipe.published_now
		end
		@feature_recipe = Recipe.feature_recipe
	end

	def show
		@recipe = Recipe.published_now.friendly.find params[:id]
	end

end
