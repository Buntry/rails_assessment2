Rails.application.routes.draw do
	root 'recipes#index'
	
	#Users
	resources :users, only: [:new, :create, :index, :show, :destroy]
	delete '/users/:id' => 'users#destroy', as: 'destroy_user'
	
	#Sessions
	get  '/login'  => 'sessions#new'
	post '/login'  => 'sessions#create'
	get  '/logout' => 'sessions#destroy'
	
	#Omniauth
	get "/auth/:provider/callback" => "sessions#check_omniauth"
	
	#Recipes
	resources :recipes, only: [:new, :create, :index, :show] do
		resources :ingredients, only: [:index]
	end
	delete '/recipes/:id' => 'recipes#destroy', as: 'destroy_recipe'
	
	get '/ingredients' => 'ingredients#index', as: 'ingredients'
	
end
