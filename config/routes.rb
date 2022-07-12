Rails.application.routes.draw do
  
  # get 'categories/show'
  # get 'categories/edit'
  # get 'categories/new'
  # get 'categories/index'

  #resources :categories
  devise_for :users
  resources :categories
  resources :posts do 
    collection do 
      post :create_comment
      delete :destroy_comment
      post :like_dislike
      delete :like_dislike
      post :create_reply
      delete :destroy_reply
      # post :search
    end
  end


  root "homes#index"
  get 'homes/index'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
