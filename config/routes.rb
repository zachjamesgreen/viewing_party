Rails.application.routes.draw do
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'

  get '/discover', to: 'movies#discover', as: 'discover'
  get '/movies', to: 'movies#movies', as: 'movies'
  post '/movies', to: 'movies#search', as: 'search'
  get '/movies/:id', to: 'movies#show', as: 'movie'
  
  root to: 'sessions#welcome'
end
