Rails.application.routes.draw do

  root to: 'requests#new'

  resources :users, only: [:edit, :update]

  resources :requests, only: [:show, :new, :create, :edit, :update] do
    resources :buildings, only: [:new, :create] do
      resources :floors, only: [:new, :create]
    end
  end
end
