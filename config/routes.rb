Rails.application.routes.draw do
  
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks", sessions: 'users/sessions'}
  
  devise_scope :user do
    get '/users/sign_out' => 'devise_sessions#destroy'
  end

  root 'mains#index'

  resources :mains, only: [:index] do
    collection do
      get 'get_publishing_item'
    end  
  end
  resources :users, only: [:update] do
    resource :mypage, only: [:show] do
      collection do
        get 'profile'
        get 'logout'
        get 'personal_info'
        post 'create_personal_info'
        get 'payment'
        get 'credit_card_reg'
        get 'credit_card_show'
        post 'create_credit_card'
        get 'items_selling'
        get 'items_during_trading'
        get 'items_sold'
        get 'bought_during_trading'
        get 'bought_past_trade'
        get 'change_shipping_address'
        get 'notice'
        get 'todo_list'
        get 'like_list'
        get 'update_email_pass'
        get 'confirm_phone'
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

  resources :items, only: [:new ,:index, :show, :create, :edit, :update, :destroy] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_size', defaults: { format: 'json' }
      get :done
    end
    resources :purchases, only: [:new] do
      collection do
        get 'buy'
      end
    end
    resources :comments, only: [:create]
  end

  resources :user_addresses, only: [:update, :create]
  resources :comments, only: [:create]
  resources :shipping_addresses, only: [:new, :create, :show, :update, :destroy]
  resources :credit_cards, only: [:new, :create, :show] do
    collection do
      post :delete
    end
  end
end