Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  resources :catalogs, only: [:index, :show]

  namespace :admin do
    resources :catalogs
    resources :categories
    resources :events
    resources :user_event_submissions, only: [:index, :edit, :update, :destroy],
                :path_names => { :edit => 'process' }
    resources :redemptions, only: [:index, :edit, :update, :destroy],
                :path_names => { :edit => 'process' }
  end
end
