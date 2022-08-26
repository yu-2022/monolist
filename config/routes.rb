Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  root to: "lists#index"

  resources :users, only: [:index, :show]
  resources :lists do
    resources :items, only: [:create, :edit, :update, :destroy]
  end
  resources :favorites, only: [:index, :create, :destroy]

end
