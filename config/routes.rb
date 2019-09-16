Rails.application.routes.draw do

  devise_for :users
  resources :games, only: [:new, :create, :show]
  root 'static_pages#index' #added for homepage
end
