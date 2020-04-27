Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/signup', to: 'customers#new'
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :customers
end
