class WeekPlan < ApplicationRecord
  has_many :meals
  belongs_to :user

  

end
