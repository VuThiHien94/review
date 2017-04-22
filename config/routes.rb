Rails.application.routes.draw do
  resources :rates
  resources :questions
	root "static_pages#home"
  get "admin/rates/results"
  get "thanks" => "static_pages#thanks"
  
	devise_for :users, path: "", path_names: {
    sign_in: "login", sign_out: "logout",
    password: "secret", confirmation: "verification",
    unlock: "unblock", registration: "register", sign_up: "" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: :show

  namespace :admin do
    resources :users, only: [:index, :edit, :update, :destroy]
    resources :questions
    resources :rates
  end
end
