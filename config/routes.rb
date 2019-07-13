Rails.application.routes.draw do
	root to: 'users#new'
	resources:users
	resources:sessions
	get '/signin', to: 'sessions#new'
end
