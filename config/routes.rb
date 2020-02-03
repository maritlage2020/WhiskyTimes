Rails.application.routes.draw do
  resources :reviews
  resources :users
  get 'reviews/top'
    root 'reviews#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
