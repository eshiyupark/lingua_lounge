Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  
  resources :vehicles do
    resources :bookings, only: [:show]
  end

  resources :my_bookings, only: [:index, :update]
  resources :bookings, only: [:index]
  resources :my_vehicles
end
