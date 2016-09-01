class IngredientsController < ApplicationController
	def index
		unless params[:recipe_id]
			@ingredients = Ingredient.all
		else
			@ingredients = Recipe.find(params[:recipe_id]).ingredients
		end
	end
end
