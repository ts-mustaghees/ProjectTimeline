Rails.application.routes.draw do
  devise_for :admins

  resources :projects,     only: [:index, :show, :create, :update, :destroy]
  resources :contributors, only: [:index, :show]

  root 'projects#index'
end
