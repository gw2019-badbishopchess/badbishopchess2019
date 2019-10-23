Rails.application.routes.draw do

  get 'dashboards/show'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :users
  
  resources :games do
    member do
      patch :join
      put :join
      patch :forfeit
      put :forfeit

    end
  end

  resource :dashboards, only: [:show] #added for user dashboard

  resources :pieces do
    member do
      patch :castling
      put :castling
    end
  end

  root 'static_pages#index' #added for homepage

end
