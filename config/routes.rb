Rails.application.routes.draw do
  get 'messages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "messages#index"
  
  resources :rooms, only: [:new, :create]
end
