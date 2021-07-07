Rails.application.routes.draw do
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'

  get '/dashboard', to: 'dashboard#index'

  get '/register', to: 'users#new'
  resources :users
  root to: 'sessions#welcome'
end
