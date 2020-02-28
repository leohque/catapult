Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'
  get '/', to: 'pages#home'

  get '/profile', to: 'pages#profile'
  resources :arts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders, except: :update
  resources :art_orders, only: :destroy

  delete 'photo', to: 'arts#delete_photo', as: 'delete_photo'

  get 'users/:user_id', to: 'users#show', as: 'user_profile'
  patch 'orders/:id', to: 'orders#cancel', as: 'order_cancel'

end
