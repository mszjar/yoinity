Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts do
    resources :comments, only: [:index, :show, :new, :create, :destroy]
  end

  resources :post_likes, only: [:create, :destroy]

  get "dashboard", to: "dashboard#show"
end
