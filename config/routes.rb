Bloccit::Application.routes.draw do
  
  devise_for :users
  resources :users, only: [:update]
 

 resources :topics do
    resources :posts, except: [:index]
  end
  
  resources :posts, only: [] do 
    resources :comments, only: [:create, :destroy] 

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

# Note the only: [] in the top-level post resources line. 
# This is because we don't want to create any /posts/:id routes, 
# just posts/:post_id/comments.
 

get 'about' => 'welcome#about'

  
  root to: 'welcome#index'
end
