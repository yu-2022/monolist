Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  root to: "lists#index"

  resources :users, only: [:index, :show]
  resources :lists do
    resources :items, only: [:create, :edit, :update, :destroy]
    collection do
      get 'search'
    end
  end
  resources :favorites, only: [:index, :create, :destroy]
  resources :tags do
    get 'items', to: 'items#search'
  end

end
