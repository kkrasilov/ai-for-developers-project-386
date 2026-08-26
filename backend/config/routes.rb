Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  # Guest-facing endpoints
  resources :event_types, only: [:index, :show] do
    resources :slots, only: [:index], module: :event_types
  end
  resources :bookings, only: [:create]

  # Owner endpoints
  namespace :owner do
    resources :bookings, only: [:index]
    resources :event_types, only: [:index, :create]
  end
end
