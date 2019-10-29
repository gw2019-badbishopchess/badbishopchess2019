Rails.application.routes.draw do

  devise_for :users,
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      # omniauth_callbacks: 'users/omniauth_callbacks'
    }
  # :omniauth_callbacks => "users/omniauth_callbacks"
  resources :users
  resources :games do
    member do
      patch :join
      put :join
      patch :forfeit
      put :forfeit
    end
  end
  resource :dashboard, only: [:show]
  resources :pieces do
    member do
      patch :castling
      put :castling
    end
  end
  resources :chats
  root 'static_pages#index' #added for homepage

end
