Rails.application.routes.draw do

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
  resources :pieces
    

  root 'static_pages#index' #added for homepage

end
