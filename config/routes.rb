Rails.application.routes.draw do

  mount Upmin::Engine => '/admin'

  root to: 'visitors#index'

  devise_for :users
  resources :users

  devise_for :customers
  resources :customers

end
