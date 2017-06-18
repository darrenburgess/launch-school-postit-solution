PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  resources :posts, except: [:destroy] do
    resources :comments, only: [:create, :index, :new]
  end
  
  resources :categories
  resources :users
end
