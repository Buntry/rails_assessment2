class Ingredient < ActiveRecord::Base
	has_many :recipe_ingredients
	has_many :recipes, through: :recipe_ingredients
	has_many :users, through: :recipes
	
	validates :name, uniqueness: true, presence: true
	
	scope :most_recipes, -> { order('recipe_ingredients_count desc') }
	
	def uses
		recipe_ingredients.count
	end
end
