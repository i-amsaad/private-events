Rails.application.routes.draw do
	root to: 'events#index'
	resources:users
	resources:sessions
	resources:events
	get '/signin', to: 'sessions#new'
	get '/signout', to: 'sessions#destroy'
end
