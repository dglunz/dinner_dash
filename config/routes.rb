Rails.application.routes.draw do
  get 'address/index'

  get 'address/show'

  get 'address/new'

  get 'address/edit'

  resources :items
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root 'users#index'

  resources :users, only: [:new, :create, :index]

  get    '/login',  to: "sessions#new"
  post   '/login',  to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
end
