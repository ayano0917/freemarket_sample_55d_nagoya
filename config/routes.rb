Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    sessions: 'users/sessions'
  }
  
  devise_scope :user do
    get '/uses/sign_out' => 'devise_sessions#destroy'
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
        get 'listing_product'
        get 'shipping_address'
        get 'during_trade'
        get 'sold'
        get 'bought_product'
        get 'past_trade'
      end
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
  resources :credit_cards, only: [:new, :create, :show, :destroy]

  resources :sign_ups, only: [:new, :create] do
    collection do
      get :register
      get :authentication
      get :complete
    end
  end
end