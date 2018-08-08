Rails.application.routes.draw do
  root 'statics#home'
  get 'admin/login', to: 'sessions#new', as: "login"
  post 'admin/login', to: 'sessions#create'
  get 'admin/logout', to: 'sessions#destroy', as: "logout"
  get 'admin/edit', to: 'users#edit'
  post 'admin/edit', to: 'users#update'

  resources :participants do
    collection { post :import}
  end
  resources :rewards

  get 'import', to: 'participants#import'
  post 'import', to: 'participants#import'
  get 'admin/increment', to: 'participants#inc', as: "inc"
  get 'admin/decrement', to: 'participants#dec', as: "dec"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
