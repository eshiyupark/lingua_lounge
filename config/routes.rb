Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :vehicles do
    resources :bookings, only: [:new, :create]
  end

  resources :my_vehicles
end
