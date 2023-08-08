Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :home, only: [:index] 
  resources :recipe_foods
  resources :recipes
  resources :foods
end
