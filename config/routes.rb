Rails.application.routes.draw do
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/signup', to: 'customers#new'
  resources :customers
end
