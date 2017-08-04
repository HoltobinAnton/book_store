Rails.application.routes.draw do
  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'home/index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:show]
  resources :reviews, only: [:create]
  resources :order_items, only: [:create, :update, :destroy]
  resource :cart, only: [:show, :update]
  root 'home#index'
end
