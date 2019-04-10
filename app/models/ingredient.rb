class Ingredient < ApplicationRecord
  has_many :meals_ingredients
  has_many :meals, through: :meals_ingredients
  validates :name, presence: true, uniqueness: true

  def find_meal_ingredient(meal)
    meals_ingredients.find_by(ingredient_id: self.id,  meal_id: meal.id)
  end

end
