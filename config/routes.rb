Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "sessions#home"
  get '/login', to: "sessions#new"
  post 'login', to: "sessions#create"
  get "/signup", to: "users#new"
  
  get 'auth/:provider/callback', to: 'sessions#google'
  get 'auth/failure', to: redirect('/')
  get '/logout', to: "sessions#destroy"
  get '/auth/github/callback' => 'sessions#github'
  
  get '/restaurants/ordered', to: "restaurants#ordered"

  resources :reviews
  resources :restaurants do 
    resources :reviews, only: [:new, :index]
  end
  
  resources :users
end
