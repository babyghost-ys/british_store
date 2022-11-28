Rails.application.routes.draw do
  get 'about/index'
  get 'about/show'
  get 'contacts/index'
  get 'contacts/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"

  resources :products, only: [:index, :show] do
    collection do
      get :search
    end
  end

  resources :categories, only: [:index, :show]

  resources :cart, only: [:index, :create, :destroy, :update]
end
