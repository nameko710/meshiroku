Rails.application.routes.draw do
  devise_for :users
  root to: 'users#show'
  resources :fridges, only: [:index, :new, :create]
  resources :eats, only: [:index, :new, :create]
  resources :users, only: [:show]
  resources :users do
    member do
      get 'graph'
    end
  end
end
