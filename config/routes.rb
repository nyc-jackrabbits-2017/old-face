Rails.application.routes.draw do
  root to: 'static#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users do 
  resources :friendships, only: [:index, :update, :destroy]
end 

end
