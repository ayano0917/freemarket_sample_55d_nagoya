Rails.application.routes.draw do
  

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    sessions: 'users/sessions'
  }
  
  devise_scope :user do
    get '/users/sign_out' => 'devise_sessions#destroy'
  end

  root 'mains#index'

  resources :mains, only: [:index]

  resources :users, only: [:update] do
    resource :mypage, only: [:show] do
      collection do
        get 'profile'
        get 'logout'
        get 'personal_info'
        get 'payment'
        get 'credit_card_reg'
        get 'credit_card_show'
        post 'create_credit_card'
        get 'items_selling'
        get 'items_during_trading'
        get 'items_sold'
        get 'bought_during_trading'
        get 'bought_past_trade'
        get 'shipping_address'
      end
    end
  end

  resources :sign_ups, only: [:new, :create] do
    collection do
      get 'register'
      get 'authentication'
      get 'complete'
    end
  end

  resources :omniauth_sign_ups, only: [:create] do
    collection do
      get 'omniauth_register'
      get 'omniauth_authentication'
    end
  end

  resources :items, only: [:new ,:index, :show, :create] do
    collection do
      get :confirm
      get :done
    end
  end

  resources :user_addresses, only: [:update]
  resources :comments, only: [:new, :create]
  resources :shipping_addresses, only: [:new, :create, :show, :update, :destroy]
  resources :credit_cards, only: [:new, :create, :show] do
    collection do
      post :delete
    end
  end
end