Rails.application.routes.draw do

  get 'quotes/index'

  root to: 'requests#new'

  resources :users, only: [:edit, :update, :show]

  resources :requests, only: [:show, :new, :create, :edit, :update] do
    resources :buildings, only: [:new, :create]
  end

    resources :quotes, only: [:show] do
      resources :bookings, only: [ :create, :show ] do 
        resources :payments, only: [:new, :create, :show]
      end
    end

  resources :buildings, only: [:show] do
    resources :floors, only: [:new, :create, :index]
    get 'floors/windows', to: 'floors/windows#new'
    post 'floors/windows', to: 'floors/windows#create', as: :windows_create
    get 'floors/rooms', to: 'floors/rooms#new'
    post 'floors/rooms', to: 'floors/rooms#create', as: :rooms_create
    get 'floors/doors', to: 'floors/doors#new'
    post 'floors/doors', to: 'floors/doors#create', as: :doors_create

    get 'hull_security', to: 'buildings/hull_security#new'
    patch 'hull_security', to: 'buildings/hull_security#create'

    get 'vds_certification', to: 'buildings/vds_certification#new'
    patch 'vds_certification', to: 'buildings/vds_certification#create', as: :vds_create

    get 'access_count', to: 'buildings/access_count#new'
    post 'access_count', to: 'buildings/access_count#create', as: :access_count_create

    get 'emergency_response', to: 'buildings/emergency_response#new'
    post 'emergency_response', to: 'buildings/emergency_response#create', as: :emergency_response_create
  end

  resources :floors, only: [:update]

end
