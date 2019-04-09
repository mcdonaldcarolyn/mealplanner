class Meal < ApplicationRecord
  has_many :meals_ingredients
  has_many :ingredients, through: :meals_ingredients
  accepts_nested_attributes_for :ingredients
  validates :title,  presence: true, uniqueness: true

  def ingredient_attributes=(ingredient_attributes)
    ingredient_attributes.each do |ingredient_attribute|
      ingredient = Ingredient.find_or_create_by(ingredient_attribute)
      self.ingredients << ingredient
    end
  end

  # def self.meat_less 
    # where("ingredients.exclude(ingredient => "chicken", "steak", "beef", "pork")")
  
  # end

  def self.random
    self.sample.title
  end

  def self.vegetarian
    where("id not in (select meal_id from meals_ingredients mi inner join ingredients i on mi.ingredient_id = i.id where i.name in ('chicken', 'steak', 'beef', 'ground beef'))")
  end

  def self.glutenfree
    where("id not in (select meal_id from meals_ingredients mi inner join ingredients i on mi.ingredient_id = i.id where i.name in ('pasta', 'bread', 'ziti', 'flour', 'farro'))")
  end
end
