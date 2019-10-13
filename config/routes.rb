Rails.application.routes.draw do
  root 'items#index'
  resources :users, only: [:index,:show ,:update ,:edit]
  resources :items, only: [:index ,:show ,:new, :create, :edit] do
    resources :comments, only: [:index, :create]
  resources :credit_cards, only: [:new]
  end
end