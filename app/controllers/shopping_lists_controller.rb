class ShoppingListsController < ApplicationController
  def index
    @foods = Food.where(user_id_id: current_user.id).order(created_at: :desc)
    @recipes = Recipe.where(user_id_id: current_user.id)

    array = @recipes.map do |recipe|
      recipe.recipe_foods.map do |food|
        { id: food.food_id_id, quantity: food.quantity }
      end
    end
    @foody = array.flatten.map { |hash| { id: hash[:id], quantity: hash[:quantity] } }

    @genfood = converting(@foods)
    result = @genfood.reject { |obj| @foody.map { |o| o[:id] }.include?(obj[:id]) }

    @shoppings = result
  end

  def converting(foood)
    foood.map do |row|
      {
        id: row.id,
        name: row.name,
        measurement_unit: row.measurement_unit,
        price: row.price,
        quantity: row.quantity,
        user_id_id: row.user_id_id,
        created_at: row.created_at,
        updated_at: row.updated_at
      }
    end
  end
end
