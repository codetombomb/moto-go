Rails.application.routes.draw do
  resources :vehicles
  resources :rentals

  get '/locations/by-city/:city', to: "locations#by_city"
  get '/users', to: 'users#get'
  delete '/users/:id', to: 'users#delete'
  patch '/users/:id', to: 'users#update'

  get '/me', to: "users#show"
  post '/signup', to: "users#create"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

end
