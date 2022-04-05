Rails.application.routes.draw do
  resources :categories
  devise_for :users
  resources :friendstables, :posts do
    resources :comments
  end
  
  get 'home/index'  
  get 'home/about'
  #root 'home#index'
  #root 'friendstables#index'
  root 'posts#index'

end
