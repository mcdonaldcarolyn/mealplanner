class MealsIngredient < ApplicationRecord
  belongs_to :meal
  belongs_to :ingredient
  accepts_nested_attributes_for :ingredient
  validates :name, presence: true, uniqueness: true

  def ingredients=(ingredient_attribute)
    ingredient = Ingredient.find_or_create_by(ingredient_attribute)
    if ingredient.id 
    self.ingredient = ingredient

    end
  end
  MealsIngredient.new
end