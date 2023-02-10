Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: "pages#home"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/politica-de-privacidad', to: 'politica_de_privacidad#index'
  get '/eliminar-datos-usuarios', to: 'politica_de_privacidad#eliminar_usuarios'
end
