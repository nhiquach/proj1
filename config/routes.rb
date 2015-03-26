Rails.application.routes.draw do
  root to: 'home#index'
  patch "pokemon/capture", to: "pokemon#capture", as: :capture
  patch "pokemon/damage", to: "pokemon#damage", as: :damage
  get "pokemon/new", to: "pokemon#new", as: :pokemons
  post "pokemon/new", to: "pokemon#create"
  devise_for :trainers
  resources :trainers
end
