Rails.application.routes.draw do
  root "events#index"
  devise_for :users
  resources :users, only: [:show]
  resources :events
  resources :attendances, only: [:create, :destroy]
end
