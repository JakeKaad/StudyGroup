Rails.application.routes.draw do
  root to: 'posts#index'

  get "register", to: 'users#new' 
  get "login", to: 'sessions#new'
  get "logout", to: 'sessions#destroy'
  post "login", to: 'sessions#create'

  resources :users, except: [:destroy]
  resources :posts, except: [:destroy]
  resources :courses, except: [:destroy]
end
