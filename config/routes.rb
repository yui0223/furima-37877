Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see 

  root to: "items#index"
  resources :items, only: [:index, :new, :create]
end
