Rails.application.routes.draw do
  get 'search', to: 'search#index'
  resources :articles
  resources :users, only: [:index, :update]
  delete 'users/:id/destroy', to: 'users#destroy', as: 'delete_user'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get 'u/:id', to: 'users#profile', as: 'profile'

  resources :posts do
    resources :comments
  end
  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'

  root 'pages#home'
end
