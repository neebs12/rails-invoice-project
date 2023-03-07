Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # make CRUD paths available in addition to path helpers
  resources :invoices
end
