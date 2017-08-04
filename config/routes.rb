Rails.application.routes.draw do
  devise_for :users, skip: [:sessions, :registrations, :passwords]
  resources :users
  resources :sessions, only: [:create, :destroy]
end
