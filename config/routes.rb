Rails.application.routes.draw do
  devise_for :users
  root to: "lists#index"
  resources :users, only: [:index]
end
