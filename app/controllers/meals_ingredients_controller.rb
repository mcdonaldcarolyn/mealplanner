class MealsIngredientsController < ApplicationController

  def create
    if meals_ingredient_params[:ingredient_id].length > 0
      meal_ingredient = MealsIngredient.create({
        :meal_id => meals_ingredient_params[:meal_id],
        :ingredient_id => meals_ingredient_params[:ingredient_id],
        :amount => meals_ingredient_params[:amount]
      })
      redirect_to meal_ingredients_path(meal_ingredient.meal)
    else
      ingredient = Ingredient.find_or_create_by({
        :name => meals_ingredient_params[:ingredient][:name]
      })
      meal_ingredient = MealsIngredient.create({
        :meal_id => meals_ingredient_params[:meal_id],
        :ingredient_id => ingredient.id,
        :amount => meals_ingredient_params[:amount]
      })
      redirect_to meal_ingredients_path(meal_ingredient.meal)
    end

    # if meal_ingredient.save
    #   redirect_to meal_ingredients_path(meal_ingredient.meal)
    # else  
    #   render :show
    # end
  end 

  def show
    @meal = Meal.find_by(params[:meal_id])
    @meals_ingredient = MealsIngredient.find(params[:id])

  end
  
  def destroy
    @meal_ingredient = MealsIngredient.find(params[:id])
    meal = @meal_ingredient.meal
    @meal_ingredient.destroy
    redirect_to meal_path(meal)
  end
  private
  
  def meals_ingredient_params
    params.require(:meals_ingredient).permit(:amount, :meal_id, :ingredient_id, ingredient:[:name])
  end

end