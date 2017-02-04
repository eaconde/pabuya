Rails.application.routes.draw do

  devise_for :users
  root to: 'home#index'

  resources :catalogs, only: [:index, :show]

  namespace :admin do
    resources :catalogs
    resources :categories
  end
end
