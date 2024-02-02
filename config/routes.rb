Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
