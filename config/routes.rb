Rails.application.routes.draw do
	root 'recipes#index'
	
	#Users
	resources :users, only: [:new, :create, :index, :show, :destroy]
	
	#Sessions
	get  '/login'  => 'sessions#new'
	post '/login'  => 'sessions#create'
	get  '/logout' => 'sessions#destroy'
	
	#Omniauth
	get "/auth/:provider/callback" => "sessions#check_omniauth"
	
	#Recipes
	resources :recipes, only: [:new, :create, :index, :show]
	
end
