Rails.application.routes.draw do
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'

  get '/movies', to: 'movies#index'
  
  root to: 'sessions#welcome'
end
