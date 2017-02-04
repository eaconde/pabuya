Rails.application.routes.draw do
  root to: 'home#index'

  resources :catalogs, only: [:index, :show]

  namespace :admin do
    resources :catalogs
    resources :catalog_types
  end
end
