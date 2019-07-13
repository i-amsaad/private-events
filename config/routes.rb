Rails.application.routes.draw do
	root to: 'sessions#new'
	resources:users
	resources:sessions
	resources:events
	get '/signin', to: 'sessions#new'
	get '/signout', to: 'sessions#destroy'
end
