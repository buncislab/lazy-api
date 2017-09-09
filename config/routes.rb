Rails.application.routes.draw do

  resources :conversations do
    resources :messages
  end
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :kelases do
    resources :comments
    resources :links
    resources :materis
    resources :videos
  end

  devise_for :users, skip: [:sessions, :registrations, :passwords]
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
end
