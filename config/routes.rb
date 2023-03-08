Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path for the application
  root "invoices#index"
  # make CRUD paths available in addition to path helpers
  resources :invoices
end
