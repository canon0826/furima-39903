Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: [:edit, :update, :show]
  resources :items do
    resources :orders, only: [:index, :create]
      resource :likes, only: [:create, :destroy]
    end
  end