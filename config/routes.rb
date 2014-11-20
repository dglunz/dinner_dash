Rails.application.routes.draw do
  resources :addresses

  root 'pages#index'

  get '/about' => 'pages#about'

  resources :items

  resources :users

  get    '/login',  to: "sessions#new"
  post   '/login',  to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

end
