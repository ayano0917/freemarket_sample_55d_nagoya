Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/uses/sign_out' => 'devise_sessions#destroy'
  end

  root 'items#index'


  resources :users, only: [:new, :create , :show, :update, :edit] do
    member do
      get :identification
    end
    collection do
      get :complete
      get :logout
    end
  end

  resources :items, only: [:new ,:index, :show] do
    collection do
      get :confirm
    end
  end

  resources :comments
  resources :credit_cards, only: [:new, :index, :show]

  resources :sign_ups, only: [:new, :create] do
    collection do
      get :register
      get :authentication
      get :address
      get :pay
      get :complete
    end
  end
end