Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/signup', to: 'customers#new'
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :customers
  resources :issues
  get 'issues/:id/resolve', to: 'issues#resolve'
  get 'issues/:id/escalate', to: 'issues#escalate'
  get 'customer/:id/upgrade', to: 'customers#upgrade'
  get 'customer/:id/downgrade', to: 'customers#downgrade'


end
