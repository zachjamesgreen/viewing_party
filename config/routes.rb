Rails.application.routes.draw do
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  get '/discover', to: 'movies#discover', as: 'discover'
  get '/movies', to: 'movies#movies', as: 'movies'
  get '/movies/:id', to: 'movies#show', as: 'movie'

  get '/dashboard', to: 'dashboard#index', as: 'dashboard'

  get '/register', to: 'users#new'
  resources :users

  post '/add_friend', to: 'user_friends#create', as: 'add_friend'

  root to: 'sessions#welcome'
end
