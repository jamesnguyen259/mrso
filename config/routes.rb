Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  mount Commontator::Engine => "/commontator"

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    passwords: "users/passwords"}

  resources :users

  resources :films
  resources :searchs
  resources :comments
  resources :reviews do
    member do
      get "like"
      get "unlike"
    end
  end

  root "films#index"
end
