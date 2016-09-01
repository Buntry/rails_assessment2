class RecipeIngredient < ActiveRecord::Base
	belongs_to :recipe, counter_cache: true
	belongs_to :ingredient, counter_cache: true
end
