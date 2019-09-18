Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :games, only: [:new, :create, :show] #changed to this format since this is what the course taught
  root 'static_pages#index' #added for homepage
end
