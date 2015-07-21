Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"

  namespace :admin do
    root "subjects#index"
    resources :subjects
    resources :users, except: [:edit]
    resources :courses
  end

  resources :users, only: [:show, :edit, :update]
  resources :users do
    resources :courses, only: [:show]
  end
end
