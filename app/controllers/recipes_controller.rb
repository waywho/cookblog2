class RecipesController < ApplicationController
	def index
		if params[:keyword]
			@recipes = Recipe.published_now.tagged_with(params[:keyword]).order(:title)
		else
			@recipes = Recipe.published_now.paginate(:page => params[:page], :per_page => 6)
		end
		@feature_recipe = Recipe.feature_recipe
	end

	def show
		@recipe = Recipe.published_now.friendly.find params[:id]
	end

	def main_dishes
		if params[:keyword]
			@recipes = Recipe.main_dishes.tagged_with(params[:keyword]).order(:title)
		else
			@recipes = Recipe.main_dishes.paginate(:page => params[:page], :per_page => 6)
		end
	end

	def desserts
		if params[:keyword]
			@recipes = Recipe.desserts.tagged_with(params[:keyword]).order(:title)
		else
			@recipes = Recipe.desserts.paginate(:page => params[:page], :per_page => 6)
		end
	end

	def articles_tips
		if params[:keyword]
			@recipes = Recipe.articles_tips.tagged_with(params[:keyword]).order(:title)
		else
			@recipes = Recipe.articles_tips.paginate(:page => params[:page], :per_page => 6)
		end	
	end

	def deals
		if params[:keyword]
			@recipes = Recipe.deals.tagged_with(params[:keyword]).order(:title)
		else
			@recipes = Recipe.deals.paginate(:page => params[:page], :per_page => 6)
		end
	end

	private

	def tag_keyword(scope_key)
		if params[:keyword]
			@recipes = Recipe.published_now.tagged_with(params[:keyword]).order(:title)
		else
			@recipes = Recipe.scope_key
		end
	end

end
