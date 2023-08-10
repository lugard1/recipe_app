Rails.application.routes.draw do
  resources :recipe_foods
  resources :recipes
  resources :foods
  devise_for :users

  root 'home#index'

  resources :home, only: [:index]
  resources :public_recipes 

  resources :shopping_lists 
  resources :recipes do
    resources :recipe_foods, only: [:new, :create, :edit, :update, :destroy]
  end
end
