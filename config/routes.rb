Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, only: [:index,:show ,:update ,:edit]
  resources :items, only: [:index ,:show ,:new, :create, :edit] do
    resources :comments, only: [:index, :create]

  end
end