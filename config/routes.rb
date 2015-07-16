Rails.application.routes.draw do
  root "static_pages#home"

  namespace :admin do
    root "subjects#index"
    resources :subjects
  end
end
