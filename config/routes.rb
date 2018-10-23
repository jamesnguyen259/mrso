Rails.application.routes.draw do
  resources :comments
  resources :reviews do
    member do
      get "like"
      get "unlike"
    end
    resources :votes, only: %i(create destroy)
  end

  resources :films
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    passwords: "users/passwords"}
  resources :users
  root "films#index"
  get 'user/:id', to: "user#show", as: 'user_path'
end
