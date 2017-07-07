PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get 'register', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :posts, except: [:destroy] do
    member do
      post :vote
    end
 
    resources :comments, only: [:create]
  end

  post 'comment/:id/vote', to: 'comments#vote', as: :vote_comment

  resources :categories
  resources :users, only: [:show, :create, :edit, :update]

  # api routes
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :show, :update]
      resources :posts, only: [:index, :create, :show, :update, :destroy]
    end
  end
end
