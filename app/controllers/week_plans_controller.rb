class WeekPlansController < ApplicationController
 
  def index

    @weekly_meals = [
      {
        :day => "Sunday",
        :meal => Meal.getRandom()
      },
      {
        :day => "Monday",
        :meal => Meal.getMeatlessMonday()
      }
    ]

  end

end