Rails.application.routes.draw do
  root to: 'static#index'
  devise_for :users

  resources :users do
    resources :posts, only: [:index, :create]
  end


end
