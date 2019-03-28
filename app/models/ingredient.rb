class Ingredient < ApplicationRecord
  belongs_to :user
  has_many :meals
  belongs_to :meals
  
end
