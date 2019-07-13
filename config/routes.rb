Rails.application.routes.draw do
	root to: 'sessions#new'
	resources:users
	resources:sessions
	get '/signin', to: 'sessions#new'
end
