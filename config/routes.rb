Rails.application.routes.draw do
  # resources :user_transactions
  devise_for :users
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end
  # resources :categories
  resources :categories, only: [:index, :new, :create, :show, :edit, :destroy] do
    resources :category_transactions, only: [:index, :new, :show, :create, :destroy]
  end
  root "home#index"
end
