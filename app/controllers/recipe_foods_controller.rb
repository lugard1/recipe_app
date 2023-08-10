class RecipeFoodsController < ApplicationController
  before_action :set_recipe, except: %i[new create]
  before_action :set_recipe_food, only: %i[edit update destroy]

  # GET /recipe_foods or /recipe_foods.json
  def index
    @recipe_foods = RecipeFood.all
  end

  # GET /recipe_foods/1 or /recipe_foods/1.json
  def show; end

  # GET /recipe_foods/new
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new
    @foods = current_user.foods
  end

  # POST /recipe_foods or /recipe_foods.json
  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe = Recipe.find(params[:recipe_id])
    @foods = current_user.foods

    @recipe_food.value = @recipe_food.quantity * @recipe_food.food.price

    @recipe_food.recipe = @recipe

    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recipe_food_url(@recipe_food), notice: 'Recipe food was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /recipe_foods/1/edit
  def edit
    @foods = current_user.foods
  end

  # PATCH/PUT /recipe_foods/1 or /recipe_foods/1.json
  def update
    if @recipe_food.update(recipe_food_params)
      redirect_to @recipe, notice: 'Recipe Food was successfully updated.'
    else
      @foods = current_user.foods
      render :edit
    end
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    @recipe_food.destroy
    redirect_to @recipe, notice: 'Recipe Food was successfully destroyed.'
  end

  def general_shopping_list
    @user_foods = current_user.foods
    @missing_foods = @user_foods - current_user.recipes.map(&:foods).flatten.uniq
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_food
    @recipe_food = @recipe.recipe_foods.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity, :value)
  end
end
