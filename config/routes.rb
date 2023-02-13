Rails.application.routes.draw do
  resources :shops
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # devise_for :users, controllers: {
  #   omniauth_callbacks: 'users/omniauth_callbacks',
  #   sessions: 'users/sessions',
  #   registrations: 'users/registrations'
  # }

  root to: "pages#home"

  resources :users, only: %i[show]

  # Users
  # get 'board', to: 'users#activity', as: :activity

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/politica-de-privacidad', to: 'politica_de_privacidad#index'
  get '/eliminar-datos-usuarios', to: 'politica_de_privacidad#eliminar_usuarios'
  get '/terminos-y-condiciones', to: 'politica_de_privacidad#condiciones'
  get '/modo-oscuro', to: 'pages#modo_oscuro'
end
