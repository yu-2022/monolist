Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  root to: "lists#index"
  resources :lists
  resources :users, only: [:index, :show]
end
