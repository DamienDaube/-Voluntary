Rails.application.routes.draw do

  resources :qr_codes, only: [:new, :create]
  root to: "qr_codes#new"

  mount ForestLiana::Engine => '/forest'
  devise_for :users
  root 'users#show'

  get '/services/categories', to: 'services#index_service_categories', as: :service_categories
  get '/services/:category', to: 'services#index_services_by_category', as: :service_category

  get '/users/:id', to: 'users#show', as: 'user'

  resources :services, only: [:index, :create, :destroy] do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:update, :destroy]

end
