Rails.application.routes.draw do
  devise_for :users
  
  root to: "tweets#index"

  resources :users, except: %i[index show]
  resources :tweets
  resources :comments, except: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  devise_scope :user do
    # Para evitar que al recargar la página despues de haber enviado espacios vacios
    # o valores que no pasan las validaciones no salga un error de "No route", tanto para sign_up
    # como para edit_profile
    post "users/sign_up", to: "devise/registrations#create"
    get "/users", to: "devise/registrations#edit"
  end

end
