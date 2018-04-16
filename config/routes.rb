Rails.application.routes.draw do
  root 'offers#index'
  
  resources :places
  resources :countries
  resources :accommodations
  resources :comments
  resources :reservations
  resources :offers
  
  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }
  
  post   '/users/:id/make_admin', to: 'users#make_admin', as: :make_admin
  delete '/users/:id/remove_admin', to: 'users#remove_admin', as: :remove_admin
  
  get '/users/admin', to: 'users#admin'
  
end