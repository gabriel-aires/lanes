require "sidekiq/web"

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  mount Sidekiq::Web => "/sidekiq"

  # Defines the root path route ("/")
  root "boards#index"

  resources :boards, only: [ :index, :show ] do
    resources :cards, only: [ :create, :edit, :update ]
  end

  delete "cards/:id/archive", to: "cards#archive", as: :archive_card
  patch "sort_cards", to: "cards#sort"
end
