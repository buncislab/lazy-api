Rails.application.routes.draw do

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
