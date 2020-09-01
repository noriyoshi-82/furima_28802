Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  get 'orders/index'
  resources :items do
    member do
      resources :orders, only: :index
    end
  end
end