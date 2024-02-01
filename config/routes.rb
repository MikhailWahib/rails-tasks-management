Rails.application.routes.draw do
  root to: "users#show", as: "home"

  get "/signup", to: "users#new", as: "signup"

  resources :users
  resources :tasks
  resources :sessions, only: [:new, :create, :destroy]

  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy", as: "logout"
end
