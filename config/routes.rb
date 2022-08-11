Rails.application.routes.draw do
  resources :posts
  devise_for :users
  resources :users
  resources :friend_requests
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "posts#index"
end
