Rails.application.routes.draw do
  get 'charges/new'
  get 'charges/create'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :charges, only: [:new, :create]
  
  root to: "charges#new"

end
