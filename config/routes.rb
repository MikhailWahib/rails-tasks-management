Rails.application.routes.draw do

  resources :users, only: %i[create]

  resources :tasks, only: %i[index new create edit update destroy]

  resources :sessions, only: %i[new create destroy]



  get '/signup', to: 'users#new', as: 'signup'

  get '/login', to: 'sessions#new', as: 'login'

  post '/login', to: 'sessions#create'

  post '/logout', to: 'sessions#destroy', as: 'logout'

  patch '/tasks/:id/toggle_status', to: 'tasks#toggle_status', as: 'toggle_status'



  root to: 'home#index', as: 'home'

end
