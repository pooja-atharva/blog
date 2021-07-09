require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  resources :comments
  resources :posts
  root 'home#index'
  # devise_for :users
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
