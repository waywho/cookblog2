class RecipesController < ApplicationController
	def index
		@tags = Recipe.tag_counts_on(:keyword)
		if params[:keyword]
			@recipes = Recipe.tagged_with(params[:keyword]).order(:title)
		else
			@recipes = Recipe.all
		end
	end

	def show
		@recipe = Recipe.friendly.find params[:id]
	end

end
