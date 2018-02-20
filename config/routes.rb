Rails.application.routes.draw do
  get 'users/show'

  get 'users/create'

  get 'users/edit'

  get 'users/update'

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :create, :edit, :update]

  resources :services do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end

  resources :bookings, except: [:new, :create, :edit]

  root to: 'pages#home'

end
