Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :omniauth_callbacks =>  "users/omniauth_callbacks"
  }
  
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

  resources :items, only: [:new ,:index, :show, :create] do
    collection do
      get :confirm
    end
  end

  resources :user_addresses, only: [:update]
  resources :comments, only: [:new, :create]
  resources :shipping_addresses, only: [:new, :create, :show, :update, :destroy]
  resources :credit_cards, only: [:index, :new, :create, :show, :destroy]

  resources :sign_ups, only: [:new, :create] do
    collection do
      get :register
      get :authentication
      get :complete
    end
  end
end