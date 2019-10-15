Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  resources :users, only: [:show, :index] do
  	resources :invites
  	resources :reviews
  end
end
