Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"

  namespace :admin do
    root "subjects#index"
    resources :subjects
    resources :users, only: [:new, :create, :show]
  end

  resources :users, only: [:show]
end
