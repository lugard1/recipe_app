class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipeshow = Recipe.includes(:recipe_foods).find(params[:id])
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit; end

  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        # Remove the format.json block to remove JSON response
      else
        format.html { render :new, status: :unprocessable_entity }
        # Remove the format.json block to remove JSON response
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe) }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    if @recipe.user_id == current_user.id
      if @recipe.recipe_foods.any?
        redirect_to @recipe,
                    alert: 'Recipe cannot be deleted until it has foods.'
      else
        @recipe.destroy
        respond_to do |format|
          format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to recipes_url, alert: 'You do not have permission to delete this recipe.' }
      end
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end
