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
      {
        :day => "Tuesday",
        :meal => Meal.sample
      }
      {
        :day => "Wednesday"
        :meal => Meal.kidFriendly()
      }
      {
        :day => "Thursday"
        :meal => Meal.sample
      }
      {
        :day => "Friday"
        :meal => Meal.sample
      }
      {
        :day => "Saturday"
        :meal => Meal.sample
      }
    ]

  end

end