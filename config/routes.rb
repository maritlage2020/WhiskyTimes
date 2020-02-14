Rails.application.routes.draw do

  devise_for :users
  root 'reviews#index'
  get '/home/about', to: 'reviews#about'
  get '/search', to: 'search#search'
  resources :reviews do
    resource :review_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
  resources :clips, only: [:index]
  resources :image_id, only: [:new, :create, :index, :show]
  resources :relationships, only: [:index, :create, :destroy]
  resources :users, only:[:index, :show, :update, :edit] do
  	member do
  	get :followings, :followers
  	end
  end
end