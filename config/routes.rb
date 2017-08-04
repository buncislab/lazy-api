Rails.application.routes.draw do
  devise_for :users, skip: [:sessions, :registrations, :passwords]
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users

end
