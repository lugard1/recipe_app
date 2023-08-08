Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  # root to:"users#index"
  root to: "home#index"

  resources :users
  resources :foods, only: %i[index new create destroy]
  resources :recipes, only: %i[index show new create destroy] do
    resources :recipe_foods, only: %i[new create destroy] 
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
