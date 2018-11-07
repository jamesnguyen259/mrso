Rails.application.routes.draw do
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  mount Commontator::Engine => "/commontator"
  resources :comments
  resources :reviews do
    member do
      get "like"
      get "unlike"
    end
  end

  resources :films
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    passwords: "users/passwords"}
  resources :users
  root "films#index"
  get 'user/:id', to: "user#show", as: 'user_path'
end
