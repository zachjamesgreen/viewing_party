Rails.application.routes.draw do
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'

  get '/register', to: 'users#new'

  root to: 'sessions#welcome'
end
