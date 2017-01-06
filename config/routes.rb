Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static#index'
  get '/users' => 'users#index'
  devise_for :users, :controllers => {:registrations => "user/registrations"}
  resources :users do
    resources :friendships, only: [:index, :update, :destroy, :new, :create]
    resources :posts, only: [:index, :create]
  end

end
