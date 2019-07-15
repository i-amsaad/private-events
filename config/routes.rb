Rails.application.routes.draw do
	root to: 'events#index'
	resources:users
	resources:sessions
	resources:events
	get '/signin', to: 'sessions#new'
	get '/signup', to: 'users#new'
	get '/signout', to: 'sessions#destroy'
	post 'attending' => 'events#attending'
end
