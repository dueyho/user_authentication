PhotoShare::Application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  root :to => 'profiles#welcome'
  resources :profiles
  resources :users
  resources :sessions
end
