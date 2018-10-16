Rails.application.routes.draw do
  resources :reviews
  resources :films
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  root "films#index"
  get 'user/:id', to: "user#show", as: 'user_path'
end
