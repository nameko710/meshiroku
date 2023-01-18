Rails.application.routes.draw do
  devise_for :users
  root to: 'fridges#index'
  resources :fridges, only: [:index, :new, :create]
  resources :eats, only: [:index, :new, :create]
end
