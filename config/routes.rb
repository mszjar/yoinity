Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  authenticated :user do
    root to: 'posts#index', as: :authenticated_root
  end

  root to: "pages#home"

  resources :categories do
    collection do
      get :set_post
    end
  end

  resources :posts, param: :token, path: 'p', as: :posts do
    resources :comments, only: [:index, :show, :new, :create, :destroy]
    member do
      get 'speech', to: 'posts#speech', defaults: { format: 'mp3' }
    end
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

  resources :remixes, only: [:create, :show] do
    member do
      get :audio
    end
  end

  resources :followers do
    member do
      post 'follow'
      post 'unfollow'
    end
  end

  get "dashboard/show", to: "dashboard#show"
  get "dashboard/saved", to: "dashboard#saved"
  get '/@:nickname', to: 'profiles#show', as: 'profile'
  post 'checkout', to: 'checkout#create'
  get '/checkout/success', to: 'checkout#success', as: 'checkout_success'
  get '/checkout/cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  post 'stripe_webhooks', to: 'stripe_webhooks#receive', as: 'stripe_webhooks'

end
