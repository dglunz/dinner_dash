Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :orders

  resources :addresses

  root 'pages#index'

  resources :items

  resources :users

  get    '/login',  to: "sessions#new"
  post   '/login',  to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :cart_items

  # namespace :admin do
  #   get '/', to: 'dashboard#index'
  # end

  resources :charges

end
