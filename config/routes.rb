Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new' #existing user needs a session
  post '/login' => 'sessions#create'

  resources :reviews
  resources :products
  resources :application_areas
  resources :chem_groups
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
