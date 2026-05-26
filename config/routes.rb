Rails.application.routes.draw do
  get "trip_allowances/create"
  get "trip_allowances/update"
  get "trip_allowances/destroy"
  get "expense_items/create"
  get "expense_items/update"
  get "expense_items/destroy"
  get "expense_claims/index"
  get "expense_claims/show"
  get "expense_claims/new"
  get "expense_claims/create"
  get "expense_claims/edit"
  get "expense_claims/update"
  get "expense_claims/destroy"
  get "top/index"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
