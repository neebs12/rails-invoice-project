Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path for the application
  root "invoices#index"
  # make a get - for the "private" view of the invoice
  get '/invoices_private/:id', to: 'invoice_private_view#private_show', as: 'private_show'
  # make a post - for the for the "send by email" button
  post '/invoices_private/:id', to: 'invoice_private_view#send_by_client_email', as: 'send_by_client_email' 


  # make CRUD paths available in addition to path helpers
  resources :invoices do
    # nested resource for invoice_items
    resources :invoice_items
  end
  # make only the new and create paths & helpers available for clients
  resources :clients, only: [:new, :create]

end
