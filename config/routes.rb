Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'
  get '/', to: 'pages#home'

  resources :arts
  resources :orders, except: :update
  resources :art_orders, only: :destroy

  delete 'photo', to: 'arts#delete_photo', as: 'delete_photo'

  get 'users/:user_id', to: 'users#show', as: 'user_profile'
  patch 'orders/:id/cancel', to: 'orders#cancel', as: 'order_cancel'
  patch 'orders/:id/confirm', to: 'orders#confirm', as: 'order_confirm'

end
