Rails.application.routes.draw do
  resources :recipe_foods
  resources :recipes
  resources :foods
  devise_for :users

  root 'home#index'

  resources :home, only: [:index]
  
  get '/public_recipes', to: 'public_recipes#index'

  resources :shopping_lists 
  resources :recipes do
    resources :recipe_foods, only: [:new, :create, :edit, :update, :destroy]
    
    member do
      get 'general_shopping_list'
    end
  end
end
