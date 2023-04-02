Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path for the application
  root "invoices#index"

  # Defines the path for the send_email action
  post "/send_email", to: "invoices#send_email"

  # make CRUD paths available in addition to path helpers
  resources :invoices do
    resources :invoice_items, only: [:new, :create]
  end

  # clients paths are limited to new and create
  resources :clients, only: [:new, :create]
  resources :invoices do
    resources :invoice_items, only: [:new, :create]
  end
end
