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
  resources :posts, param: :token, path: 'p', as: :posts do
    resources :comments, only: [:index, :show, :new, :create, :destroy]
  end

  resources :comments do
    resources :comment_replies, only: [:create, :destroy]
  end

  resources :comment_likes, only: [:create, :destroy]
  resources :comment_dislikes, only: [:create, :destroy]
  resources :comment_reply_likes, only: [:create, :destroy]
  resources :post_likes, only: [:create, :destroy]
  resources :post_qualities, only: [:create, :destroy]
  resources :saved_for_laters, only: [:index, :create, :destroy]

  resources :followers do
    member do
      post 'follow'
      post 'unfollow'
    end
  end

  resources :posts, param: :token do
    member do
      get 'speech', to: 'posts#speech', defaults: { format: 'mp3' }
    end
  end

  get "dashboard/show", to: "dashboard#show"
  get "dashboard/saved", to: "dashboard#saved"
  get '/@:nickname', to: 'profiles#show', as: 'profile'
  get 'about', to: 'pages#about'
  get 'web3', to: 'pages#web3'
end
