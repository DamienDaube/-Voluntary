Rails.application.routes.draw do
  devise_for :users
  root to: 'services#index_service_categories'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/services', to: 'services#index_service_categories', as: :service_categories

  get '/services', to: 'services#index_service_categories', as: :service_categories
  get '/services/:category', to: 'services#index_services_by_category', as: :service_category

  resources :services, except: [:index] do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end

  resources :bookings, except: [:new, :create, :edit]

 # get 'services/:service.category', "services#index_by_category"

end
