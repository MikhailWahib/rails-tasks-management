Rails.application.routes.draw do
  root to: 'users#show', as: 'home'

  get '/signup', to: 'users#new', as: 'signup'

  resources :users, only: %i[new create]
  resources :tasks, only: %i[index new create edit update destroy]
  resources :sessions, only: %i[new create destroy]

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy', as: 'logout'
  patch '/tasks/:id/toggle_status', to: 'tasks#toggle_status', as: 'toggle_status'
end
