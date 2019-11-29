Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new' #existing user needs a session
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new' #a new user needs to be created before it has a session
  post '/signup' => 'users#create'

  get '/auth/google_oauth2/callback' => 'sessions#omniauth'

  resources :reviews
  resources :products do
    resources :reviews, only: [:new, :index] #this is creating the path /products/1/reviews/new or index
  end
  resources :application_areas
  resources :chem_groups
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
