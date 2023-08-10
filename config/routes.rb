Rails.application.routes.draw do
  get 'public_recipes/index'
  devise_for :users

  root 'home#index'

  resources :home, only: [:index] 
  resources :recipe_foods
  resources :recipes
  resources :foods
  resources :public_recipes, only: :index
end
