Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  root to: "lists#index"
  resources :lists, only: [:new, :create]
  resources :users, only: [:index, :show]
end
