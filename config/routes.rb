Rails.application.routes.draw do
  devise_for :users
  resources :categories, only: [:index, :new, :create, :show, :edit, :destroy] do
    resources :category_transactions, only: [:index, :new, :show, :create, :destroy]
  end
  resources :category_transactions

  resources :home, only: [:index]
  
  root "categories#index"
end
