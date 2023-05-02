Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'landing#home'

  get '/register', to: 'users#register'
  get 'users/:id/search', to: 'users#search'

  resources :users, only: [:create, :show]
end
