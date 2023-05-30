Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  post 'vehicles', to: "vehicles#create"
  get 'vehicles/new', to: "vehicles#new"
end
