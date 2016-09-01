Rails.application.routes.draw do
	root 'users#index'
	
	resources :users, only: [:new, :create, :index, :show]
	
	#Sessions
	get  '/login'  => 'sessions#new'
	post '/login'  => 'sessions#create'
	get  '/logout' => 'sessions#destroy'
	
	#Omniauth
	get "/auth/:provider/callback" => "sessions#check_omniauth"
	
end
