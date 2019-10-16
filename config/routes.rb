Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  resources :users, only: [:show, :index] do
  	resources :invites, only: :create
  	resources :reviews
  end
  resources :invites, only: [:index, :update]
end
