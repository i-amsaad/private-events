Rails.application.routes.draw do
  root to: 'events#index'
  resources:users
  resources:sessions
  resources:events do
    member do
      post :attending
    end
  end
  get '/signin', to: 'sessions#new'
  get '/signup', to: 'users#new'
  get '/signout', to: 'sessions#destroy'
end
