class MealsController < ApplicationController
    before_action :authenticate_user!

  def index
    @meals = Meal.all
  end
  
  def show
    @meal = Meal.find(params[:id])
    @ingredient = Ingredient.new
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      redirect_to meals_path
    else
      render :new
    end
  end

  def edit 
    @meal = Meal.find(params[:id])
  end

  def update
    @meal = Meal.find(params[:id])
      @meal.update(meal_params)
    if @meal.save
      redirect_to meals_path
    else 
      redirect_to meals_path
    end
  end
  
  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
    redirect_to meals_path
  end
  

private 
  def meal_params
    params.require(:meal).permit(:title)
  end
end
