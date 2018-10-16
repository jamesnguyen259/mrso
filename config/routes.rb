Rails.application.routes.draw do
  resources :films
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  resources :users
  root "films#index"
end
