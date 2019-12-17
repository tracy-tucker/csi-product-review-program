Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new' #existing user needs a session
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new' #a new user needs to be created before it has a session
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy' #NOT get because anyone can "request" that URL

  get 'products/most_reviews' => 'products#most_reviews'
  get 'users/user_most_reviews' => 'users#user_most_reviews'

  get '/auth/google_oauth2/callback' => 'sessions#omniauth'

  resources :reviews
  resources :products do
    resources :reviews, only: [:new, :index] #this is creating the path /products/1/reviews/new or index
  end
  resources :application_areas, only: [:index, :new, :create]
  resources :chem_groups, only: [:index, :new, :create]
  resources :categories, only: [:index, :new, :create, :show]
  resources :users, only: [:new, :create, :show]

  match '*path', via: :all, to: redirect('/404')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
