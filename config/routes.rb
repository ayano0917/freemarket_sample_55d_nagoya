Rails.application.routes.draw do
root 'items#index'
get "users/show" => "users#show"
end