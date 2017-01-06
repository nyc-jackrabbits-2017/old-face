Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static#index'
  devise_for :users

  get 'users/:id/friendships/new' => 'friendships#new'
  post 'users/:id/friendships' => 'friendships#create'
end
