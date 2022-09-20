Rails.application.routes.draw do
  root 'home#index'

  resources :comments
  resources :users
  resources :posts
  resources :post
end
