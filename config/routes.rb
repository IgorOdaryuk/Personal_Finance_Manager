Rails.application.routes.draw do

  
  devise_for :users
  get 'reports', to: "reports#index"
  get 'reports/index'
  get 'reports/report_by_category', to: "reports#report_by_category"
  get 'reports/report_by_dates', to: "reports#report_by_dates"
  get 'main/index'
  get 'categories/:id/show_operations', to: "categories#show_operations", as: :show_category_operations

  get 'locales', to: "locales#set_locale"

  resources :operations
  resources :categories

  get '/404', to: 'errors#not_found'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "main#index"


end
