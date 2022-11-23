Rails.application.routes.draw do
  get 'about/index'
  get 'about/show'
  get 'contacts/index'
  get 'contacts/show'
  get 'categories/index'
  get 'categories/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"

  resources :products, only: [:index, :show]
end
