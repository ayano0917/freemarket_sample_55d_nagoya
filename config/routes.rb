Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users, only: [:new, :show, :update, :edit] do
      member do
        get :logout
        get :identification
      end

      collection do
        get :complete
      end
  end
  resources :items, only: [:new, :index, :show, :create] do
      member do
        get :confirm
      end
  end
  resources :comments
  resources :credit_cards, only: [:new, :index]
  resources :sign_ups, only: [:new, :create] do
      member do
        get :register
        get :authentication
        get :address
        get :pay
        get :complete
      end
  end
end