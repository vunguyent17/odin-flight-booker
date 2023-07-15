Rails.application.routes.draw do
  devise_for :users, 
  path: 'auth', 
  path_names: {
     sign_in: 'login',
     sign_out: 'logout',
     password: 'secret',
     confirmation: 'verification',
     unlock: 'unblock',
     registration: 'register',
     sign_up: 'signup' 
    },
    controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "flights#index"
  get 'profiles', to: 'profiles#show', as: :show_profile
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server'
  get '/422', to: 'errors#unprocessable'
  resources :bookings, only: [:new, :create, :show]
end
