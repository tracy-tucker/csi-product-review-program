Rails.application.routes.draw do
  resources :reviews
  resources :products
  resources :application_areas
  resources :chem_groups
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
