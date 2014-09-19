Bloccit::Application.routes.draw do
  
 
  # resources :users, only: [:update]
 

 resources :topics do
  resources :posts, except: [:index] do
  resources :comments, only: [:create, :destroy] 
  end
end

 devise_for :users

get 'about' => 'welcome#about'

  
  root to: 'welcome#index'
end
