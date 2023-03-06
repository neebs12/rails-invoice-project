Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # make CRUD paths available in addition to path helpers
  resources :invoices do
    # nested resource for invoice_items
    resources :invoice_items
  end
  # make only the new and create paths & helpers available for clients
  resources :clients, only: [:new, :create]

end
