Rails.application.routes.draw do
  resources :posts
  devise_for :users
  resources :users
  resources :friend_requests
  resources :friendships
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/friends', to: 'users#friends', as: :friends
  scope '/friends', as: :friends do
    get 'find', to: 'users#index'
    # get 'requests', to: 'users#friend_requests'
  end

  root to: "posts#index"
end

