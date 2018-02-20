Rails.application.routes.draw do
  devise_for :users
  root to: 'services#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :edit, :update]

  resources :services do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end

  resources :bookings, except: [:new, :create, :edit]



end
