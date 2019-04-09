class IngredientsController < ApplicationController

  def index
    if params[:meal_id]
      @meal = Meal.find(params[:meal_id])
      @ingredients = @meal.ingredients
      render :show
    else 
      @ingredients = Ingredient.all
    end
  end
  
  def show
    @ingredient = Ingredient.find(params[:id])
    @meals_ingredients = MealsIngredient.all
    # @meal = Meal.find(params[:id])
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save!
      redirect_to meal_ingredients_path
    else
      render :new
    end
  end

  def edit 
    @ingredient = Ingredient.find(params[:id])
    @ingredients  = Ingredient.all
  end

  def update
    @ingredient = Ingredient.find(params[:id])
      @ingredient.update(ingredient_params)
    if @ingredient.save
      redirect_to ingredients_path
    else 
      render :new
    end
  end
  
  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to meals_path(@meal)
  end
  

private 
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end



