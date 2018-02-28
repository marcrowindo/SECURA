Rails.application.routes.draw do

  root to: 'requests#new'

  resources :users, only: [:edit, :update]

  resources :requests, only: [:show, :new, :create, :edit, :update] do
    resources :buildings, only: [:new, :create]
  end

  resources :buildings, only: [:show] do
    resources :floors, only: [:new, :create, :index]
    get 'floors/windows', to: 'floors/windows#new'
    post 'floors/windows', to: 'floors/windows#create', as: :windows_create
  end

  resources :floors, only: [:update]

end
