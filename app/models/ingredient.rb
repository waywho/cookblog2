class Ingredient < ActiveRecord::Base
	has_many :ingredient_forms
	has_many :recipes, through: :ingredient_forms
end
