Rails.application.routes.draw do
  resources :addresses

  resources :items
  
  root 'users#index'

  resources :users, only: [:new, :create, :index]

  get    '/login',  to: "sessions#new"
  post   '/login',  to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

end
