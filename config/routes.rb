Rails.application.routes.draw do
  resources :posts
  devise_for :users
  resources :users
  resources :friend_requests
  resources :friendships
  resources :comments
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "posts#index"
end

