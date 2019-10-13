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
  resources :items, only: [:new ,:index, :show]
  resources :comments
  resources :credit_cards, only: [:new]
end