Rails.application.routes.draw do
  get 'address/index'

  get 'address/show'

  get 'address/new'

  get 'address/edit'

  root 'pages#index'

  get '/about' => 'pages#about'

  resources :items

  resources :users, only: [:new, :create, :index]

  get    '/login',  to: "sessions#new"
  post   '/login',  to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
end
