Rails.application.routes.draw do

  root "static_pages#index"
  get 'search', to: 'static_pages#search'
end
