Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/new'
  get 'categories/create'
  get 'categories/show'
  get 'categories/destroy'
  get 'categories/set_post'
  get 'categories/params_category'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts do
    resources :comments, only: [:index, :show, :new, :create, :destroy]
  end

  resources :comments do
    resources :comment_replies, only: [:create, :destroy]
  end

  resources :comment_likes, only: [:create, :destroy]
  resources :comment_dislikes, only: [:create, :destroy]
  resources :post_likes, only: [:create, :destroy]
  resources :post_qualities, only: [:create, :destroy]
  resources :saved_for_laters, only: [:index, :create, :destroy]

  resources :followers do
    member do
      post 'follow'
      post 'unfollow'
    end
  end

  get "dashboard/show", to: "dashboard#show"
  get "dashboard/saved", to: "dashboard#saved"
  get 'about', to: 'pages#about'
  get 'web3', to: 'pages#web3'
end
