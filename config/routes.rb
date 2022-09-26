Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :comments
  resources :users
  resources :posts
  resources :post
end
