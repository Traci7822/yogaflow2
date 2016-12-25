Rails.application.routes.draw do
  root to: 'sequence#index'

  resources :sequence, only: [:new, :create]

end
