Rails.application.routes.draw do
  root to: 'users#index'
  get "register", to: 'users#new' 

  resources :users, except: [:destroy]
end
