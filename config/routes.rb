Rails.application.routes.draw do
  resources :sessions, only: :create, :destroy
  resources :users, only: :edit, :update
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
