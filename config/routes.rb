Rails.application.routes.draw do
  resources :orders

  resources :addresses

  root 'pages#index'

  resources :items

  resources :users

  get    '/login',  to: "sessions#new"
  post   '/login',  to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :cart_items

  namespace :admin do
    get '/', to: 'dashboard#index'
    get '/users', to: 'users#index'
    get '/users/:id/edit', to: 'users#edit'
    get '/users/:id', to: 'users#show'
    patch '/users/id', to: 'users#update'
    put '/users/id', to: 'users#update'
    delete '/users/id', to: 'users#update'
  end

  resources :charges

end
