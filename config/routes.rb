Reader::Application.routes.draw do

  resources :articles, :only => [:index, :show] do
    resources :comments, :only => [:create, :update, :destroy]
    member do
      put 'add_star'
      put 'remove_star'
    end
  end

  resources :suscriptions

  authenticated :user do
    root :to => 'suscriptions#index'
  end
  root :to => "home#index"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
end

