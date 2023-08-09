Rails.application.routes.draw do
  devise_for :users

  resources :users
  resources :events
  resources :attendances

  get '/', to: 'home#home'
  get '/user', to: 'user#user'
=begin  get '/team', to: 'team#team'
  get '/contact', to: 'contact#contact' 
  get '/sessions/new', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/profil', to: 'profil#index', as: :profil
=end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
