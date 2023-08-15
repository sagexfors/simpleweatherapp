Rails.application.routes.draw do

  root "static_pages#index"
  get 'search', to: 'static_pages#search'
  resources :hourly_forecasts, only: [:show]
  resources :daily_forecasts, only: [:show]
end
