Rails.application.routes.draw do
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  
  root to: 'sessions#welcome'
end
