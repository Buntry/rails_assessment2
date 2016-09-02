class RecipesController < ApplicationController
	def index
		@recipes = Recipe.all
	end
	
	def new
		if signed_in?
			@recipe = Recipe.new
		else
			redirect_to root_path, error: 'You need to be signed in to create a recipe'
		end
	end
	
	def create
		@recipe = Recipe.new(recipe_params)
		if @recipe.save
			redirect_to @recipe
		else
			flash[:error] = 'There was an error'
			render :new
		end
	end
	
	def show
		@recipe = Recipe.find(params[:id])
	end
	
	def destroy
		@recipe = Recipe.find(params[:id])
		if @recipe.user == current_user
			@recipe.delete
		end
		
		redirect_to root_path
	end
	
	private
	def recipe_params
		params.require(:recipe).permit(:user_id, :name, :description, ingredient_ids: [], ingredients_attributes: [:name])
	end
end
