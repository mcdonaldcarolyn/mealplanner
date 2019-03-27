class MealsController < ApplicationController
    before_action :authenticate_user!

  def index
    @meals = Meal.all
  end
  
  def show
    @meal = Meal.find(params[:id])
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      redirect_to @meal
    else 
      render :new
    end
  end
private 
  def meal_params
    params.require(:meal).permit(:title)
  end
end
