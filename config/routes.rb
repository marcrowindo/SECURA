Rails.application.routes.draw do

  root to: 'requests#new'

  resources :users, only: [:edit, :update]

  resources :requests, only: [:show, :new, :create, :edit, :update] do
    resources :buildings, only: [:new, :create]
  end

  resources :buildings, only: [:show] do
    resources :floors, only: [:new, :create, :index]
    get 'floors/windows', to: 'floors/windows#new'
    post 'floors/windows', to: 'floors/windows#create'
    get 'hull_security', to: 'buildings/hull_security#new'
    patch 'hull_security', to: 'buildings/hull_security#create'
  end

  resources :floors, only: [:update]

end
