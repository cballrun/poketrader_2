Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'landing#home'

  get '/register', to: 'users#register'
  get 'users/:id/search', to: 'users#search'
  get "/users/:user_id/cards/:card_id/owned-cards/new", to: 'owned_cards#new'
  get "/users/:user_id/cards/:card_id/owned-cards/edit", to: 'owned_cards#edit'
  post "/users/:user_id/cards/:card_id/owned-card/create", to: 'owned_cards#create'


  resources :users, only: [:create, :show] do
    resources :cards, only: [:index, :show]
  end
end
