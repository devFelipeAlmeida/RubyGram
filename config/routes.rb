Rails.application.routes.draw do
  resources :posts
  devise_for :users
  
  authenticated :user do
    root to: 'home#index', as: :authenticated_root
  end
  
  root to: redirect('/users/sign_in')
  
  post "toggle_like", to: 'likes#toggle_like', as: :toggle_like

  resources :comments, only: [:create, :destroy]
  resources :users, only:[:show, :index]

  post "follow", to: "follows#follow", as: :follow
  delete "unfollow", to: "follows#unfollow", as: :unfollow
  delete "cancel_req", to: "follows#cancel_request", as: :cancel_request

  post "accept_follow", to: "follows#accept_follow", as: :accept_follow
  delete "decline_follow", to: "follows#decline_follow", as: :decline_follow


end
