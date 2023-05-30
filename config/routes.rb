Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'new', to: "vehicles#new", as: :new_vehicle
  post 'create', to: "vehicles#create"
end
