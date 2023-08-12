class ShoppingListsController < ApplicationController
  def index
    @user_foods = Food.where(user_id: current_user.id).order(created_at: :desc)
    @recipes = Recipe.where(user_id: current_user.id)

    # Get foods added to recipes
    foods_added_to_recipes = @recipes.flat_map(&:recipe_foods).map(&:food_id)

    # Get unique foods that are added to recipes
    @shoppings = Food.where(id: foods_added_to_recipes).order(:name)
  end
end
