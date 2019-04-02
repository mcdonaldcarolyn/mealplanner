class MealsIngredientsController < ApplicationController

  def create
   meal_ingredient = MealsIngredient.new(meals_ingredient_params)
   meal_ingredient.save
  
   redirect_to meal_path(meal_ingredient.meal)
  end 
  
  private
  
  def meals_ingredient_params
    params.require(:meals_ingredient).permit(:amount, :meal_id, :ingredient_id, ingredients:[:name])
  end

end