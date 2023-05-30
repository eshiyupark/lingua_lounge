Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  
  get '/vehicles/:id', to: "vehicles#show"
end
