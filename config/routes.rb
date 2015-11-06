Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  resources :appointments
  resources :pets
  resources :users

  get "doctors/index"
  root :to => 'appointments#index'
end

