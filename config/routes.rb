Rails.application.routes.draw do
  root to: 'static#index'
  get '/users' => 'users#index'
  devise_for :users

  resources :users do
    resources :friendships, only: [:index, :update, :destroy]
    resources :posts, only: [:index, :create]
  end

end
