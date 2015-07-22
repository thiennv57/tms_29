Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"

  namespace :admin do
    root "dashboard#index"
    resources :subjects
    resources :users, except: [:edit]
    resources :courses
    resources :course_subjects do
      match "/:status" => "course_subjects#update", as: :status,
      via: :put, constraints: {status: /(started|finished)/}
    end 
    resources :courses do
      resource :assign_users, only: [:edit, :update]
    end
  end
  resources :users, only: [:show, :edit, :update]
  resources :courses do
    resources :subjects, only: :show
  end
  resources :users do
    resources :courses, only: [:show]
  end
end
