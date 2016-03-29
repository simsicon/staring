Rails.application.routes.draw do
  get 'strangers/show'

  resources :users, only: [:new, :create, :show] do
    member do
      put :stay
    end
  end

  resources :strangers, only: [:show] do
    member do
      put :stay
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  root 'pages#home'
end
