Rails.application.routes.draw do
  get 'chat/:id', to: 'chats#show', as: 'chat'
  get 'searches/search'
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  get 'followeds/:id' => 'users#followeds', as: "followeds"
  get 'followers/:id' => 'users#followers', as: "followers"
  get 'search' => "searches#search"
  resources :users, only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
  end
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :chats, only: [:create]
end