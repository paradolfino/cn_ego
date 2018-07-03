Rails.application.routes.draw do
  get 'participants/index'
  get 'participants/show'
  get 'participants/new'
  get 'participants/edit'
  root 'statics#home'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'update/admin/:id', to: 'users#edit'
  resources :users, only: [:update]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
