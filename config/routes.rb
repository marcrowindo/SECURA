Rails.application.routes.draw do
  get 'floors/new'

  get 'floors/create'

  get 'buildings/new'

  get 'buildings/create'

  get 'requests/new'

  get 'requests/create'

  get 'requests/edit'

  get 'requests/update'

  get 'users/edit'

  get 'users/update'

  root to: 'requests#new'

  resources :requests, only: [:show] do
    resources :buildings, only: [:new, :create] do
      resources :floors, only: [:new, :create]
    end
  end
end
