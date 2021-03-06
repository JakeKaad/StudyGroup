Rails.application.routes.draw do
  root to: 'courses#index'

  get "register", to: 'users#new' 
  get "login", to: 'sessions#new'
  get "logout", to: 'sessions#destroy'
  post "login", to: 'sessions#create'
  get "edit-post", to: 'posts#edit'

  resources :users, except: [:destroy]

  resources :courses, except: [:destroy] do
  	member do
  		post :enroll
    end
  	resources :posts, except: [:destroy]
  end

  resources :study_groups, except: [:index, :destroy] do
    member do
      post :enroll
    end
      resources :posts, except: [:destroy]
  end

end
