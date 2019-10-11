Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:index,:show ,:create, :update ,:edit]
  resources :items, only: [:index ,:show ,:new, :create, :edit] do
    resources :comments, only: [:index, :create]
  resources :credit_cards, only: [:new]
  end
end