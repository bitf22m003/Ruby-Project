Rails.application.routes.draw do
  
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "pages#index"

  get "collection", to: "pages#collection"
  get "contact", to: "pages#contact"
  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new'

  #resources :cars, only: [:index, :show]  #  for users
  
  resources :cars, only: [:index, :show] do
  resources :bookings, only: [:new, :create]
end

  
  namespace :admin do
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  resources :cars
  get 'view_all_cars', to: 'cars#view_all'
  resources :bookings, only: [:index]
end

  

end
