class Meal < ApplicationRecord
  has_many :meals_ingredients
  has_many :ingredients, through: :meals_ingredients
  accepts_nested_attributes_for :ingredients

  def ingredient_attributes=(ingredient_attributes)
    ingredient_attributes.each do |ingredient_attribute|
      ingredient = Ingredient.find_or_create_by(ingredient_attribute)
      self.ingredients << ingredient
    end
  end

  # def self.meat_less 
    # where("ingredients.exclude(ingredient => "chicken", "steak", "beef", "pork")")
  
  # end

end
