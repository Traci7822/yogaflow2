Rails.application.routes.draw do
  root to: 'sequence#index'

  resources :sequence, only: [:new, :create, :show]
  resources :pose, only: [:new, :create]

  match 'auth/:provider', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  get '/auth/facebook/callback', to: 'sessions#create'
end
