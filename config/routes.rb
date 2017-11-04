Rails.application.routes.draw do
    
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :checkouts, only: [:confirm_email] do 
    member do
      get :confirm_email
    end
  end
  resource :user, only: [:edit, :show, :update]
  scope "(:locale)", locale: /en|ua/ do
    resources :books, only: [:show]
    resources :checkouts do
      member do
        get :finish_wizard
      end
    end
    resources :reviews, only: [:create]
    resources :order_items, only: [:create, :update, :destroy]
    resource :cart, only: [:show, :update]
    resources :categories, only: [:index, :show]
    root 'home#index'
  end
end
