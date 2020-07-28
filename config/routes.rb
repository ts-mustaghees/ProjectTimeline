Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    unlocks:  'admins/unlocks'
  }

  get :admin,               to: 'admins/admins#show'
  get 'admin/projects',     to: 'admins/admins#show'
  get 'admin/categories',   to: 'admins/admins#categories'
  get 'admin/technologies', to: 'admins/admins#technologies'
  get 'admin/contributors', to: 'admins/admins#contributors'

  resources :projects,     only: [:index, :edit, :show, :create, :update, :destroy]
  resources :contributors, only: [:index, :edit, :show, :create, :update, :destroy]
  resources :technologies, only: [:edit, :create, :update, :destroy]
  resources :categories,   only: [:edit, :create, :update, :destroy]

  # API
  get 'api/projects', to: 'api#projects'

  root 'projects#index'
end
