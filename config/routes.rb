Rails.application.routes.draw do
  root 'statics#home'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'update/admin/:id', to: 'users#edit'
  resources :users, only: [:update]
  resources :participants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
